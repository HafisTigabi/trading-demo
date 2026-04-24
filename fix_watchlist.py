import re

path = '/Users/hafis/Documents/trading_demo_app/lib/features/trading/presentation/pages/watchlist_page.dart'
with open(path, 'r') as f:
    content = f.read()

content = content.replace('builder: (context) { BuildContext context = innerContext;', 'builder: (context) {')
content = content.replace('innerContext', 'context')

with open(path, 'w') as f:
    f.write(content)
print("Done")
