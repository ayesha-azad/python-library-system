from flask import Flask, g, session, redirect, render_template, request, jsonify, Response
from Misc.functions import *

from Models.extensions import init_dao

app = Flask(__name__)
app.secret_key = '#$ab9&^BB00_.'

# Initialize DAO
init_dao(app)

# Import blueprints AFTER app + DAO setup
from routes.user import user_view
from routes.book import book_view
from routes.admin import admin_view

app.jinja_env.globals.update(
    ago=ago,
    str=str,
)

app.register_blueprint(user_view)
app.register_blueprint(book_view)
app.register_blueprint(admin_view)

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=4010, debug=True)
