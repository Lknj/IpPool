# *-* coding:utf-8 *-*
import requests
import re
from bs4 import BeautifulSoup
from lxml import etree
from multiprocessing import Process, Queue
import SQLTool


MySql = SQLTool.MySQL()


class Proxies(object):
    """docstring for Proxies"""

    def __init__(self, page=1):
        self.proxies = []
        self.verify_pro = []
        self.page = page
        self.headers = {
            'Accept': '*/*',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) '
                          'Chrome/45.0.2454.101 Safari/537.36',
            'Accept-Encoding': 'gzip, deflate, sdch',
            'Accept-Language': 'zh-CN,zh;q=0.8'
        }
        self.get_proxies()
        self.get_proxies_nn()
        # self.get_proxies_zdy()

    def get_proxies(self):
        page = 1
        page_stop = page + self.page
        while page < page_stop:
            url = 'http://www.xicidaili.com/nt/{}'.format(page)
            html = requests.get(url, headers=self.headers).content
            soup = BeautifulSoup(html, 'lxml')
            ip_list = soup.find(id='ip_list')
            for odd in ip_list.find_all(class_='odd'):
                protocol = odd.find_all('td')[5].get_text().lower() + '://'
                self.proxies.append(protocol + ':'.join([x.get_text() for x in odd.find_all('td')[1:3]]))
            page += 1

    def get_proxies_nn(self):
        page = 1
        page_stop = page + self.page
        while page < page_stop:
            url = 'http://www.xicidaili.com/nn/{}'.format(page)
            html = requests.get(url, headers=self.headers).content
            soup = BeautifulSoup(html, 'lxml')
            ip_list = soup.find(id='ip_list')
            for odd in ip_list.find_all(class_='odd'):
                protocol = odd.find_all('td')[5].get_text().lower() + '://'
                self.proxies.append(protocol + ':'.join([x.get_text() for x in odd.find_all('td')[1:3]]))
            page += 1

    # def get_proxies_zdy(self):
    #     '''
    #     爬取站大爷免费ip
    #     :return:
    #     '''
    #     home_url = 'https://www.zdaye.com/dayProxy.html'
    #     requests.packages.urllib3.disable_warnings()  # 取消警告
    #     my_ip_proxy = requests.get('http://39.100.30.196:5000/v1/get_ip').text
    #     html = etree.HTML(
    #         requests.get(home_url, headers=self.headers, verify=False).text,
    #         parser=etree.HTMLParser(encoding='utf-8')
    #     )
    #     init_url = html.xpath('//*[@id="J_posts_list"]/div[2]/div/h3/a/@href')[0]
    #     number = int(str(init_url).split('.')[0].split('/')[-1])
    #     for i in range(24):
    #         url = 'https://www.zdaye.com/dayProxy/ip/{}.html'.format(number)
    #         ip_html = etree.HTML(
    #             requests.get(url, headers=self.headers, verify=False).text,
    #             parser=etree.HTMLParser(encoding='utf-8')
    #         )
    #         ip_port = ip_html.xpath('//*[@id="J_posts_list"]/div[3]/text()')
    #         ip_result = ip_html.xpath('//*[@id="J_posts_list"]/div[3]/a/text()')
    #         for n in range(len(ip_port)):
    #             port, protocol = ip_port.split('#')[0].split('@')
    #             proxy = protocol.lower() + '://' + ip_result[n] + ':' + port
    #             self.proxies.append(proxy)
    #         number -= 1


    def verify_proxies(self):
        # 没验证的代理
        old_queue = Queue()
        # 验证后的代理
        new_queue = Queue()
        print('verify proxy........')
        works = []
        for _ in range(15):
            works.append(Process(target=self.verify_one_proxy, args=(old_queue, new_queue)))
        for work in works:
            work.start()
        for proxy in self.proxies:
            old_queue.put(proxy)
        for work in works:
            old_queue.put(0)
        for work in works:
            work.join()
        self.proxies = []
        while 1:
            try:
                ip = new_queue.get(timeout=1)
                sql = 'SELECT proxy FROM xx_ip WHERE ip=%s'
                result = MySql.select(sql, ip)
                if not result:
                    self.proxies.append(ip)
                # self.proxies.append(ip)
            except:
                break
        sql = 'INSERT INTO xx_ip(protocol, ip) VALUES (%s, %s)'
        try:
            MySql.insert(sql, self.proxies)
        except Exception as e:
            print('重复！')
        print('verify_proxies done!')

    def verify_one_proxy(self, old_queue, new_queue):
        while 1:
            proxy = old_queue.get()
            if proxy == 0:
                break
            protocol = 'https' if 'https' in proxy else 'http'
            proxies = {protocol: proxy}
            try:
                if requests.get('http://www.baidu.com', proxies=proxies, timeout=2).status_code == 200:
                    print('success %s' % proxy)
                    new_queue.put((protocol, proxy))
            except:
                print('fail %s' % proxy)
