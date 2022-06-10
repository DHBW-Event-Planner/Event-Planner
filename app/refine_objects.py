import connection
def refine_events(events):
    """ Refine all Events"""
    data = []
    for e in events:
        resultData = {"artist_id": e[0],
                      "location_id": e[1],
                      "account_id": e[2],
                      "event_id": e[3],
                      "event_title": e[4],
                      "event_description": e[5],
                      "event_date": e[6],
                      "event_starttime": e[7],
                      "event_duration": e[8]}
        data.append(resultData)
    return data


def refine_artist(artists):
    """ Refine all Artists"""
    data = []
    for a in artists:
        resultData = {"artist_id": a[0],
                      "artist_bandname": a[1],
                      "artist_membersize": a[2],
                      "artist_founddate": a[3]}
        data.append(resultData)
    return data
