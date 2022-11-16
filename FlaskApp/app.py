from flask import Flask, url_for, redirect, render_template, request, session, jsonify
import time
from data_persistence import *
from datetime import timedelta
database = []
app = Flask(__name__)


@app.route("/<room>")
def home(room):
    return render_template("index.html")


# @app.route("/chat/<room>",  methods=["POST", "GET"])
@app.route('/api/chat/<room>', methods=["POST", "GET"])
def front_end_api(room):

    if request.method == "POST":

        username = request.form["username"]
        message = request.form["msg"]
        message_date = time.ctime()
        save(room, message_date, username, message)
        returned_data = save(room, message_date, username, message)

        database.append(returned_data)

        session["database"] = database
        # return redirect(url_for("front_end_api", room=room))
        return jsonify({"success": True})

    elif request.method == "GET":
        if "database" in session:
            data_stream = session["database"]
            value = ""
            for details in data_stream:
                value += f"[ {details['message_date']} ]  {details['username']} : {details['message']}\n"
            return jsonify(value)
        else:
            value=""
            gettRoom_data(room)
            
            # print(data)
            # for details in data:
            #     print(details)
            #     value += f"[ {details['message_date']} ]  {details['username']} : {details['message']}\n"
            return jsonify(value)


if __name__ == "__main__":
    app.secret_key = ["QAZ2WSXCDE#4RFVBGT%6YHNMJU&8IKQWERTYUIOP;LKJHGFDSAZXCVBNM"]
    app.permanent_session_lifetime=timedelta(minutes=1)
    app.run(debug=True, port=4000)
