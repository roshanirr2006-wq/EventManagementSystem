<!DOCTYPE html>
<html>
<head>
    <title>Event Management System</title>

 <style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        font-family: Arial, sans-serif;
        color: #25213b;
        background:
            radial-gradient(circle at 15% 20%, #ddd6fe 0, transparent 28%),
            radial-gradient(circle at 85% 80%, #fbcfe8 0, transparent 30%),
            linear-gradient(135deg, #f5f3ff, #fdf4ff);
        min-height: 100vh;
    }

    /* NAVBAR */

    .navbar {
        height: 70px;
        background: rgba(255, 255, 255, 0.88);
        backdrop-filter: blur(10px);
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 8%;
        border-bottom: 1px solid rgba(139, 92, 246, 0.12);
    }

    .logo {
        font-size: 24px;
        font-weight: bold;
        color: #2e1065;
        letter-spacing: -0.5px;
    }

    .logo span {
        color: #7c3aed;
    }

    .nav-link {
        color: #6b6280;
        font-size: 14px;
    }

    /* MAIN */

    .main {
        min-height: calc(100vh - 70px);
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 50px 20px;
    }

    .box {
        width: 900px;
        background: rgba(255, 255, 255, 0.92);
        border-radius: 22px;
        padding: 60px;
        display: flex;
        align-items: center;
        gap: 65px;
        border: 1px solid rgba(139, 92, 246, 0.15);
        box-shadow: 0 25px 60px rgba(76, 29, 149, 0.12);
    }

    /* LEFT SIDE */

    .left {
        flex: 1;
    }

    .small-title {
        display: inline-block;
        color: #7c3aed;
        background: #ede9fe;
        padding: 7px 13px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: bold;
        margin-bottom: 18px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    h1 {
        font-size: 42px;
        line-height: 1.12;
        margin: 0 0 18px;
        color: #2e1065;
        letter-spacing: -1px;
    }

    .description {
        color: #6b6280;
        line-height: 1.7;
        font-size: 15px;
        margin-bottom: 32px;
        max-width: 520px;
    }

    /* BUTTONS */

    .buttons {
        display: flex;
        gap: 12px;
    }

    .btn {
        text-decoration: none;
        padding: 13px 23px;
        border-radius: 8px;
        font-size: 14px;
        font-weight: bold;
        transition: all 0.25s ease;
    }

    .primary {
        background: linear-gradient(135deg, #7c3aed, #9333ea);
        color: white;
        box-shadow: 0 6px 15px rgba(124, 58, 237, 0.25);
    }

    .primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 9px 20px rgba(124, 58, 237, 0.35);
    }

    .secondary {
        background: #ffffff;
        color: #6d28d9;
        border: 1px solid #d8b4fe;
    }

    .secondary:hover {
        background: #faf5ff;
        transform: translateY(-2px);
    }

    /* RIGHT CARD */

    .right {
        width: 260px;
    }

    .info-card {
        background: linear-gradient(145deg, #faf5ff, #f3e8ff);
        border: 1px solid #e9d5ff;
        border-radius: 16px;
        padding: 28px;
        box-shadow: 0 10px 25px rgba(124, 58, 237, 0.08);
    }

    .info-card h3 {
        margin-top: 0;
        margin-bottom: 22px;
        font-size: 17px;
        color: #3b0764;
    }

    .feature {
        display: flex;
        align-items: center;
        gap: 12px;
        margin: 18px 0;
        color: #5b536d;
        font-size: 14px;
    }

    .number {
        width: 32px;
        height: 32px;
        flex-shrink: 0;
        background: #7c3aed;
        color: white;
        border-radius: 9px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        font-weight: bold;
        box-shadow: 0 4px 10px rgba(124, 58, 237, 0.2);
    }

    /* FOOTER */

    .footer {
        margin-top: 35px;
        color: #a59ab8;
        font-size: 12px;
    }

    /* MOBILE */

    @media (max-width: 750px) {

        .navbar {
            padding: 0 25px;
        }

        .nav-link {
            display: none;
        }

        .box {
            flex-direction: column;
            padding: 40px 25px;
            gap: 35px;
        }

        .right {
            width: 100%;
        }

        h1 {
            font-size: 32px;
        }

        .buttons {
            flex-direction: column;
        }

        .btn {
            text-align: center;
        }
    }
</style>
</head>

<body>

    <div class="navbar">

        <div class="logo">
            Event<span>Hub</span>
        </div>

        <div class="nav-link">
            Manage your college events
        </div>

    </div>


    <div class="main">

        <div class="box">

            <div class="left">

                <div class="small-title">
                    Event Management
                </div>

                <h1>
                    Plan and manage your events
                </h1>

                <p class="description">
                    Create events, manage event details and allow
                    students to register for upcoming events from
                    one simple platform.
                </p>

                <div class="buttons">

                    <a href="addEvent.jsp" class="btn primary">
                        Add New Event
                    </a>

                    <a href="EventServlet?action=list" class="btn secondary">
                        View Events
                    </a>

                </div>

                <div class="footer">
                    Event Management System
                </div>

            </div>


            <div class="right">

                <div class="info-card">

                    <h3>What you can do</h3>

                    <div class="feature">
                        <div class="number">1</div>
                        <span>Create Events</span>
                    </div>

                    <div class="feature">
                        <div class="number">2</div>
                        <span>Manage Events</span>
                    </div>

                    <div class="feature">
                        <div class="number">3</div>
                        <span>Student Registration</span>
                    </div>

                </div>

            </div>

        </div>

    </div>

</body>
</html>