<!DOCTYPE html>
<html>
<head>
    <title>New Contact Form Submission</title>
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>New Contact Form Submission</h2>
        </div>
        
        <div class="content">
            <p>A new contact form has been submitted with the following details:</p>
            
            <div class="message-box">
                <p><strong>Name:</strong> {{ $contactData['name'] }}</p>
                <p><strong>Email:</strong> {{ $contactData['email'] }}</p>
                <p><strong>Subject:</strong> {{ $contactData['subject'] }}</p>
                <p><strong>Message:</strong></p>
                <p>{{ $contactData['message'] }}</p>
            </div>
            
            <p>Please review this message and take appropriate action.</p>
        </div>
        
        <div class="footer">
            <p>This is an automated message, please do not reply to this email.</p>
            <p>&copy; {{ date('Y') }} Your Company Name. All rights reserved.</p>
        </div>
    </div>
</body>
</html> 