<!DOCTYPE html>
<html>

<head>
    <title>Thank You for Contacting Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
        }

        .content {
            padding: 20px;
        }

        .message-box {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin: 15px 0;
        }

        .footer {
            text-align: center;
            padding: 20px;
            font-size: 12px;
            color: #6c757d;
            border-top: 1px solid #dee2e6;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 15px 0;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h2>Thank You for Contacting Us</h2>
        </div>

        <div class="content">
            <p>Dear {{ $contactData['name'] }},</p>

            <p>Thank you for reaching out to us. We have received your message and appreciate you taking the time to
                contact us.</p>

            <p>Our team will review your message and get back to you as soon as possible. We typically respond within
                24-48 business hours.</p>

            <p>If you have any additional questions or information to share, please don't hesitate to contact us again.
            </p>

            <p>Best regards,<br>
                Your Company Name Team</p>

            <center>
                <a href="{{ url('/') }}" class="button">Visit Our Website</a>
            </center>
        </div>

        <div class="footer">
            <p>This is an automated message, please do not reply to this email.</p>
            <p>&copy; {{ date('Y') }} Your Company Name. All rights reserved.</p>
        </div>
    </div>
</body>

</html>
