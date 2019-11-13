from flask import Blueprint
from flask_restful import Api
from apps.v1.get_ip import GetIp


def register_views(app):
    api = Api(app)
    api.add_resource(
        GetIp, '/get_ip', endpoint="get_ip"
    )


def create_blueprint_v1():
    """
    注册蓝图->v1版本
    :return:
    """
    bp_v1 = Blueprint('v1', __name__)
    register_views(bp_v1)
    return bp_v1