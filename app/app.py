from flask import Flask, jsonify, render_template
import jinja2
import datetime
import refine_objects
from connection import get_connection, get_all_from_table, run_sql_command_one_result

app = Flask(__name__)


@app.route("/")
def show_startPage():
    print(run_sql_command_one_result(f'SELECT location_name FROM location WHERE location.location_id = {1}')[0])
    return render_template('index.html', utc_dt=datetime.datetime.utcnow())


@app.route("/events/")
def show_events():
    environment = jinja2.Environment()
    environment.filters['run_sql_command_one_result'] = run_sql_command_one_result
    return render_template('events.html', events_list=refine_objects.refine_events(get_all_from_table('event')))


if __name__ == "__main__":
    app.run()
