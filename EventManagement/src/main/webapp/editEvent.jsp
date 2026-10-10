<%@ page import="com.eventmanagement.Event" %>

<%
    Event event = (Event) request.getAttribute("event");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Edit Event</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #29233d;
            background:
                radial-gradient(circle at 8% 10%, #e9ddff 0, transparent 25%),
                radial-gradient(circle at 92% 90%, #f8d9ea 0, transparent 28%),
                #f8f6fc;
            min-height: 100vh;
            padding: 45px 20px;
        }

        .page {
            max-width: 950px;
            margin: auto;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .brand {
            font-size: 21px;
            font-weight: bold;
            color: #32105f;
        }

        .back-top {
            color: #6d28d9;
            text-decoration: none;
            font-size: 13px;
            font-weight: bold;
        }

        .back-top:hover {
            text-decoration: underline;
        }

        .card {
            display: flex;
            background: white;
            border-radius: 22px;
            overflow: hidden;
            border: 1px solid #e8def2;
            box-shadow: 0 22px 55px rgba(69, 39, 103, 0.12);
        }

        .side {
            width: 35%;
            padding: 45px 35px;
            background:
                linear-gradient(155deg, #4c1d95, #6d28d9 55%, #8b5cf6);
            color: white;
            position: relative;
            overflow: hidden;
        }

        .side:after {
            content: "";
            position: absolute;
            width: 190px;
            height: 190px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
            right: -80px;
            bottom: -60px;
        }

        .side-tag {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 20px;
            background: rgba(255,255,255,0.14);
            font-size: 11px;
            font-weight: bold;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            margin-bottom: 25px;
        }

        .side h1 {
            font-size: 31px;
            line-height: 1.2;
            margin: 0 0 18px;
        }

        .side p {
            font-size: 13px;
            line-height: 1.7;
            color: #eee7ff;
            margin-bottom: 35px;
        }

        .event-preview {
            border-top: 1px solid rgba(255,255,255,0.2);
            padding-top: 22px;
        }

        .preview-label {
            font-size: 11px;
            color: #ddd1ff;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            margin-bottom: 8px;
        }

        .preview-name {
            font-size: 17px;
            font-weight: bold;
            margin-bottom: 18px;
        }

        .preview-row {
            font-size: 12px;
            color: #eee7ff;
            margin: 10px 0;
        }

        .form-section {
            width: 65%;
            padding: 45px;
        }

        .form-heading {
            margin-bottom: 28px;
        }

        .form-heading h2 {
            margin: 0 0 7px;
            color: #32105f;
            font-size: 25px;
        }

        .form-heading p {
            margin: 0;
            color: #81768f;
            font-size: 13px;
        }

        .form-row {
            display: flex;
            gap: 18px;
        }

        .field {
            flex: 1;
        }

        label {
            display: block;
            color: #443b56;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 7px;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #ddd4e8;
            border-radius: 8px;
            background: #fcfbfe;
            color: #342d42;
            font-family: Arial, sans-serif;
            font-size: 13px;
            outline: none;
            margin-bottom: 18px;
            transition: 0.2s;
        }

        input:focus,
        textarea:focus {
            background: white;
            border-color: #8b5cf6;
            box-shadow: 0 0 0 3px rgba(139,92,246,0.09);
        }

        textarea {
            resize: vertical;
            min-height: 95px;
        }

        .actions {
            display: flex;
            gap: 12px;
            margin-top: 5px;
        }

        .update-btn {
            flex: 1;
            border: none;
            padding: 13px;
            border-radius: 8px;
            background: #6d28d9;
            color: white;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s;
        }

        .update-btn:hover {
            background: #5b21b6;
            transform: translateY(-1px);
        }

        .cancel-btn {
            padding: 13px 20px;
            border-radius: 8px;
            background: white;
            border: 1px solid #d8cbe5;
            color: #6d28d9;
            text-decoration: none;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
        }

        .cancel-btn:hover {
            background: #faf7ff;
        }

        @media (max-width: 750px) {

            body {
                padding: 25px 12px;
            }

            .card {
                flex-direction: column;
            }

            .side,
            .form-section {
                width: 100%;
            }

            .side {
                padding: 32px 25px;
            }

            .form-section {
                padding: 30px 25px;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .topbar {
                padding: 0 5px;
            }

        }

    </style>

</head>

<body>

<div class="page">

    <div class="topbar">

        <div class="brand">
            EventHub
        </div>

        <a href="EventServlet?action=list" class="back-top">
            Back to Events
        </a>

    </div>


    <div class="card">


        <div class="side">

            <div class="side-tag">
                Event Management
            </div>

            <h1>
                Update your event
            </h1>

            <p>
                Make changes to the event details and keep
                your event information up to date.
            </p>


            <div class="event-preview">

                <div class="preview-label">
                    Editing Event
                </div>

                <div class="preview-name">
                    <%= event.getEventName() %>
                </div>

                <div class="preview-row">
                    Date: <%= event.getEventDate() %>
                </div>

                <div class="preview-row">
                    Venue: <%= event.getVenue() %>
                </div>

            </div>

        </div>


        <div class="form-section">

            <div class="form-heading">

                <h2>Edit Event Details</h2>

                <p>Update the information below and save your changes.</p>

            </div>


            <form action="EventServlet" method="post">

                <input type="hidden"
                       name="action"
                       value="update">

                <input type="hidden"
                       name="id"
                       value="<%= event.getId() %>">


                <label>Event Name</label>

                <input type="text"
                       name="eventName"
                       value="<%= event.getEventName() %>"
                       required>


                <label>Description</label>

                <textarea name="description"><%= event.getDescription() %></textarea>


                <div class="form-row">

                    <div class="field">

                        <label>Event Date</label>

                        <input type="date"
                               name="eventDate"
                               value="<%= event.getEventDate() %>"
                               required>

                    </div>


                    <div class="field">

                        <label>Venue</label>

                        <input type="text"
                               name="venue"
                               value="<%= event.getVenue() %>"
                               required>

                    </div>

                </div>


                <label>Organizer</label>

                <input type="text"
                       name="organizer"
                       value="<%= event.getOrganizer() %>"
                       required>


                <div class="actions">

                    <a href="EventServlet?action=list"
                       class="cancel-btn">
                        Cancel
                    </a>

                    <input type="submit"
                           value="Save Changes"
                           class="update-btn">

                </div>

            </form>

        </div>

    </div>

</div>

</body>

</html>