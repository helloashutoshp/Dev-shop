<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Detail</title>
</head>

<body style="font-family: Arial, sans-serif; background-color: #f8f9fa; padding: 20px;">
    <div
        style="max-width: 700px; margin: auto; background-color: #ffffff; padding: 30px; border-radius: 10px; box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);">
        
        <!-- Title -->
        <h2 style="text-align: center; color: #343a40; margin-bottom: 10px;">Thank You for Your Order!</h2>
        <p style="text-align: center; font-size: 16px; color: #495057;">
            Your order ID is <strong>#{{ $mailData['order']->id }}</strong>
        </p>

        <!-- Shipping Address -->
        <div style="margin-top: 30px; border: 1px solid #dee2e6; border-radius: 6px; padding: 20px; background-color: #f8f9fa;">
            <h4 style="margin-bottom: 10px; color: #343a40;">Shipping Address</h4>
            <p style="margin: 0; color: #495057;">
                <strong>{{ $mailData['order']->firstName }} {{ $mailData['order']->lastName }}</strong><br>
                {{ $mailData['order']->address }}, {{ $mailData['order']->city }}<br>
                {{ $mailData['order']->state }}, {{ getCountryName($mailData['order']->country_id)->name }}, {{ $mailData['order']->zip }}<br>
                <strong>Phone:</strong> {{ $mailData['order']->mobile }}<br>
                <strong>Email:</strong> {{ $mailData['order']->email }}
            </p>
        </div>

        <!-- Order Items Table -->
        <table style="width: 100%; border-collapse: collapse; margin-top: 30px;">
            <thead>
                <tr style="background-color: #343a40; color: #ffffff;">
                    <th style="padding: 12px; text-align: left;">Product</th>
                    <th style="padding: 12px; text-align: center;">Price</th>
                    <th style="padding: 12px; text-align: center;">Qty</th>
                    <th style="padding: 12px; text-align: center;">Total</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($mailData['order']->orderItems as $item)
                    <tr style="border-bottom: 1px solid #dee2e6;">
                        <td style="padding: 10px;">{{ $item->name }}</td>
                        <td style="padding: 10px; text-align: center;">${{ number_format($item->price, 2) }}</td>
                        <td style="padding: 10px; text-align: center;">{{ $item->qty }}</td>
                        <td style="padding: 10px; text-align: center;">${{ number_format($item->total, 2) }}</td>
                    </tr>
                @endforeach
                <!-- Totals -->
                <tr>
                    <td colspan="3" style="padding: 10px; text-align: right; font-weight: bold;">Subtotal:</td>
                    <td style="padding: 10px; text-align: center;">${{ number_format($mailData['order']->subtotal, 2) }}</td>
                </tr>
                <tr>
                    <td colspan="3" style="padding: 10px; text-align: right; font-weight: bold;">Discount:</td>
                    <td style="padding: 10px; text-align: center;">-${{ number_format($mailData['order']->discount, 2) }}</td>
                </tr>
                <tr>
                    <td colspan="3" style="padding: 10px; text-align: right; font-weight: bold;">Shipping:</td>
                    <td style="padding: 10px; text-align: center;">+${{ number_format($mailData['order']->shipping, 2) }}</td>
                </tr>
                <tr style="background-color: #e9ecef;">
                    <td colspan="3" style="padding: 15px; text-align: right; font-weight: bold;">Grand Total:</td>
                    <td style="padding: 15px; text-align: center; font-size: 16px;">
                        <strong>${{ number_format($mailData['order']->grandTotal, 2) }}</strong>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- Footer -->
        <p style="margin-top: 40px; text-align: center; font-size: 14px; color: #6c757d;">
            If you have any questions, feel free to contact our support team.
        </p>
    </div>
</body>

</html>
