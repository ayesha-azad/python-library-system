from Models.DAO import DAO

dao = None

def init_dao(app):
    global dao
    dao = DAO(app)
