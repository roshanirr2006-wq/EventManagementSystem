<%@ page import="java.util.List" %>
<%@ page import="com.eventmanagement.Event" %>

<!DOCTYPE html>
<html>

<head>

    <title>Events - Event Management System</title>

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
            padding: 35px 20px;
        }

        .container {
            width: 95%;
            max-width: 1250px;
            margin: auto;
            background: rgba(255, 255, 255, 0.94);
            padding: 30px;
            border-radius: 20px;
            border: 1px solid rgba(139, 92, 246, 0.15);
            box-shadow: 0 20px 50px rgba(76, 29, 149, 0.12);
        }

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .heading-area h1 {
            margin: 0 0 7px;
            color: #2e1065;
            font-size: 30px;
        }

        .heading-area p {
            margin: 0;
            color: #7b718d;
            font-size: 14px;
        }

        .add-button {
            display: inline-block;
            padding: 12px 20px;
            background: linear-gradient(135deg, #7c3aed, #9333ea);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            box-shadow: 0 6px 15px rgba(124, 58, 237, 0.22);
            transition: 0.25s;
        }

        .add-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 9px 20px rgba(124, 58, 237, 0.30);
        }

        .table-wrapper {
            overflow-x: auto;
            border: 1px solid #eadff7;
            border-radius: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        th {
            padding: 15px 12px;
            background: #4c1d95;
            color: white;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
        }

        td {
            padding: 14px 12px;
            border-bottom: 1px solid #eee7f5;
            color: #5b536d;
            font-size: 13px;
            text-align: center;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tbody tr {
            background: white;
            transition: 0.2s;
        }

        tbody tr:hover {
            background: #faf7ff;
        }

        td:first-child {
            font-weight: bold;
            color: #6d28d9;
        }

        .actions {
            white-space: nowrap;
        }

        .edit,
        .delete,
        .register {
            display: inline-block;
            padding: 7px 11px;
            margin: 2px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 12px;
            font-weight: bold;
            transition: 0.2s;
        }

        .edit {
            background: #ede9fe;
            color: #6d28d9;
        }

        .edit:hover {
            background: #ddd6fe;
        }

        .delete {
            background: #fee2e2;
            color: #dc2626;
        }

        .delete:hover {
            background: #fecaca;
        }

        .register {
            background: #e0e7ff;
            color: #4338ca;
        }

        .register:hover {
            background: #c7d2fe;
        }

        .bottom-link {
            display: inline-block;
            margin-top: 20px;
            color: #6d28d9;
            text-decoration: none;
            font-size: 13px;
            font-weight: bold;
        }

        .bottom-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 700px) {

            body {
                padding: 20px 10px;
            }

            .container {
                width: 100%;
                padding: 20px;
            }

            .top-section {
                flex-direction: column;
                align-items: flex-start;
                gap: 18px;
            }

            .add-button {
                width: 100%;
                text-align: center;
            }

            .heading-area h1 {
                font-size: 25px;
            }
        }

    </style>

</head>

<body>

<div class="container">

    <div class="top-section">

        <div class="heading-area">

            <h1>Events</h1>

            <p>Manage and register for upcoming events</p>

        </div>

        <a href="addEvent.jsp" class="add-button">
            + Add New Event
        </a>

    </div>


    <div class="table-wrapper">

        <table>

            <tr>

                <th>ID</th>
                <th>Event Name</th>
                <th>Description</th>
                <th>Date</th>
                <th>Venue</th>
                <th>Organizer</th>
                <th>Actions</th>

            </tr>


            <%

                List<Event> eventList =
                    (List<Event>) request.getAttribute("eventList");

                if (eventList != null) {

                    for (Event event : eventList) {

            %>


            <tr>

                <td>
                    <%= event.getId() %>
                </td>

                <td>
                    <%= event.getEventName() %>
                </td>

                <td>
                    <%= event.getDescription() %>
                </td>

                <td>
                    <%= event.getEventDate() %>
                </td>

                <td>
                    <%= event.getVenue() %>
                </td>

                <td>
                    <%= event.getOrganizer() %>
                </td>


                <td class="actions">

                    <a class="edit"
                       href="EventServlet?action=edit&id=<%= event.getId() %>">
                        Edit
                    </a>


                    <a class="delete"
                       href="EventServlet?action=delete&id=<%= event.getId() %>"
                       onclick="return confirm('Are you sure you want to delete this event?');">
                        Delete
                    </a>


                    <a class="register"
                       href="EventServlet?action=register&id=<%= event.getId() %>">
                        Register
                    </a>

                </td>

            </tr>


            <%

                    }

                }

            %>

        </table>

    </div>


    

</div>

</body>

</html>