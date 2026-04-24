import re

path = '/Users/hafis/Documents/trading_demo_app/lib/features/trading/presentation/pages/watchlist_page.dart'
with open(path, 'r') as f:
    content = f.read()

widgets = [
    'EdgeInsets', 'SizedBox', 'Text', 'Icon', 'Padding', 'Divider', 'Spacer', 'Center',
    'Column', 'Row', 'InputDecoration', 'BoxConstraints', 'SnackBar', 'TextStyle', 'BorderRadius',
    'BoxDecoration', 'Container', 'ListView', 'Expanded', 'Align', 'Positioned', 'Stack', 'Scaffold',
    'AppBar', 'ListTile', 'Dismissible', 'InkWell', 'GestureDetector', 'Container', 'BorderSide'
]

for w in widgets:
    content = re.sub(r'const\s+(' + w + r'\b)', r'\1', content)

content = re.sub(r'const\s+\[', r'[', content)

with open(path, 'w') as f:
    f.write(content)
print("Done")
