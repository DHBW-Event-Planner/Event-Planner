from flask import Flask, jsonify, render_template
import jinja2
import datetime
import refine_objects
from connection import get_connection, get_all_from_table, run_sql_command_one_result

app = Flask(__name__)


@app.route("/")
def show_startPage():
    # print(refine_objects.refine_location(get_all_from_table("location")))
    # print(run_sql_command_one_result(f'SELECT location_name FROM location WHERE location.location_id = {1}')[0])
    return render_template('index.html', utc_dt=datetime.datetime.utcnow())


@app.route("/events/")
def show_events():
    event_object = []
    for event in refine_objects.refine_events(get_all_from_table('event')):
        location = (run_sql_command_one_result(f'SELECT * FROM location WHERE location.location_id = {event["location_id"]}')[0])
        location = {"location_id": location[0], "location_name": location[1], "location_street": location[2],
                  "location_houesnumber": location[3], "location_postcode": location[4], "location_city": location[5], "location_country": location[6], "location_maxticket": location[7]}
        artist = (run_sql_command_one_result(f'SELECT * FROM artist WHERE artist.artist_id = {event["artist_id"]}')[0])
        artist = {"artist_id": artist[0], "artist_bandname": artist[1], "artist_membersize": artist[2], "artist_founddate": artist[3]}
        result_data = [event, location, artist]
        event_object.append(result_data)
    return render_template('events.html', events_list=event_object)


@app.route("/locations/")
def show_location():
    locations = refine_objects.refine_location(get_all_from_table("location"))
    return render_template('location.html', location_list=locations)


@app.route("/artists/")
def show_artists():
    artists = refine_objects.refine_artist(get_all_from_table("artist"))
    return render_template('artists.html', artist_list=artists)


@app.route("/shop/")
def show_shop():

    return render_template('shop.html')


if __name__ == "__main__":
    app.debug = True
    app.run()
