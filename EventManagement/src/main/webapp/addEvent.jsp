<!DOCTYPE html>
<html>

<head>

    <title>Add Event</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #25213b;
            background:
                radial-gradient(circle at 10% 15%, #ddd6fe 0, transparent 25%),
                radial-gradient(circle at 90% 85%, #fbcfe8 0, transparent 28%),
                linear-gradient(135deg, #f5f3ff, #fdf4ff);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container {
            width: 500px;
            max-width: 100%;
            margin: 20px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 35px;
            border-radius: 20px;
            border: 1px solid rgba(139, 92, 246, 0.15);
            box-shadow: 0 20px 50px rgba(76, 29, 149, 0.12);
        }

        .heading {
            text-align: center;
            margin-bottom: 30px;
        }

        .heading h2 {
            margin: 0 0 8px;
            color: #2e1065;
            font-size: 28px;
        }

        .heading p {
            margin: 0;
            color: #7b718d;
            font-size: 13px;
        }

        label {
            display: block;
            font-weight: bold;
            color: #443b56;
            font-size: 13px;
            margin-bottom: 7px;
        }

        input,
        textarea {
            width: 100%;
            padding: 11px 12px;
            margin-bottom: 18px;
            border: 1px solid #ddd1ed;
            border-radius: 8px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            color: #332b42;
            background: #fff;
            outline: none;
        }

        input:focus,
        textarea:focus {
            border-color: #8b5cf6;
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.10);
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background: linear-gradient(135deg, #7c3aed, #9333ea);
            color: white;
            border: none;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            padding: 13px;
            margin-top: 5px;
            margin-bottom: 0;
            box-shadow: 0 6px 15px rgba(124, 58, 237, 0.22);
            transition: 0.25s;
        }

        input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 9px 20px rgba(124, 58, 237, 0.30);
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #6d28d9;
            text-decoration: none;
            font-size: 13px;
            font-weight: bold;
        }

        .back:hover {
            text-decoration: underline;
        }

        @media (max-width: 550px) {

            body {
                padding: 20px 10px;
            }

            .container {
                padding: 28px 22px;
            }

        }

    </style>

</head>

<body>

<div class="container">

    <div class="heading">

        <h2>Add New Event</h2>

        <p>Create and add a new event to the system</p>

    </div>


    <form action="EventServlet" method="post">

        <input type="hidden" name="action" value="add">


        <label>Event Name:</label>

        <input type="text"
               name="eventName"
               placeholder="Enter event name"
               required>


        <label>Description:</label>

        <textarea name="description"
                  rows="4"
                  placeholder="Enter event description"></textarea>


        <label>Event Date:</label>

        <input type="date"
               name="eventDate"
               required>


        <label>Venue:</label>

        <input type="text"
               name="venue"
               placeholder="Enter event venue"
               required>


        <label>Organizer:</label>

        <input type="text"
               name="organizer"
               placeholder="Enter organizer name"
               required>


        <input type="submit" value="Add Event">

    </form>


    <a href="EventServlet?action=list" class="back">
        Back to Events
    </a>

</div>

</body>

</html>