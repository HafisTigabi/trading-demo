import re

path = '/Users/hafis/Documents/trading_demo_app/lib/features/trading/presentation/pages/watchlist_page.dart'
with open(path, 'r') as f:
    content = f.read()

# Add Context to methods
content = content.replace('Widget _buildTopSummary()', 'Widget _buildTopSummary(BuildContext context)')
content = content.replace('Widget _buildTabs()', 'Widget _buildTabs(BuildContext context)')
content = content.replace('Widget _buildLoader()', 'Widget _buildLoader(BuildContext context)')
content = content.replace('Widget _buildEmpty()', 'Widget _buildEmpty(BuildContext context)')
content = content.replace('Widget _buildError(String message)', 'Widget _buildError(BuildContext context, String message)')

# Fix calls
content = content.replace('_buildTopSummary(),', '_buildTopSummary(innerContext),')
content = content.replace('_buildTabs(),', '_buildTabs(innerContext),')
content = content.replace('error: (message) => _buildError(message),', 'error: (message) => _buildError(context, message),')
content = content.replace('_buildLoader(),', '_buildLoader(context),')
content = content.replace('_buildEmpty(),', '_buildEmpty(context),')

# Add import
content = content.replace("import 'package:trading_demo_app/features/trading/presentation/pages/edit_watchlist_page.dart';", "import 'package:trading_demo_app/features/trading/presentation/pages/edit_watchlist_page.dart';\nimport 'package:trading_demo_app/shared/helper/responsive_size.dart';")

# Font sizes & Icons
content = re.sub(r'fontSize:\s*([\d\.]+)', r'fontSize: rs(context, \1)', content)
content = re.sub(r'size:\s*([\d\.]+),', r'size: rs(context, \1),', content)
content = re.sub(r'size:\s*([\d\.]+)\)', r'size: rs(context, \1))', content)

# EdgeInsets
content = re.sub(r'EdgeInsets\.all\(([\d\.]+)\)', r'EdgeInsets.all(rs(context, \1))', content)
content = re.sub(r'EdgeInsets\.symmetric\(\s*horizontal:\s*([\d\.]+)\s*,\s*vertical:\s*([\d\.]+)\s*\)', r'EdgeInsets.symmetric(horizontal: rs(context, \1), vertical: rs(context, \2))', content)
content = re.sub(r'EdgeInsets\.symmetric\(\s*horizontal:\s*([\d\.]+)\s*\)', r'EdgeInsets.symmetric(horizontal: rs(context, \1))', content)
content = re.sub(r'EdgeInsets\.symmetric\(\s*vertical:\s*([\d\.]+)\s*\)', r'EdgeInsets.symmetric(vertical: rs(context, \1))', content)
content = re.sub(r'EdgeInsets\.only\(\s*left:\s*([\d\.]+)\s*,\s*right:\s*([\d\.]+)\s*,\s*bottom:\s*([\d\.]+)\s*\)', r'EdgeInsets.only(left: rs(context, \1), right: rs(context, \2), bottom: rs(context, \3))', content)
content = re.sub(r'EdgeInsets\.only\(\s*top:\s*([\d\.]+)\s*,\s*bottom:\s*([\d\.]+)\s*\)', r'EdgeInsets.only(top: rs(context, \1), bottom: rs(context, \2))', content)
content = re.sub(r'EdgeInsets\.only\(\s*right:\s*([\d\.]+)\s*\)', r'EdgeInsets.only(right: rs(context, \1))', content)
content = re.sub(r'EdgeInsets\.only\(\s*left:\s*([\d\.]+)\s*\)', r'EdgeInsets.only(left: rs(context, \1))', content)
content = re.sub(r'EdgeInsets\.only\(\s*top:\s*([\d\.]+)\s*\)', r'EdgeInsets.only(top: rs(context, \1))', content)
content = re.sub(r'EdgeInsets\.only\(\s*bottom:\s*([\d\.]+)\s*\)', r'EdgeInsets.only(bottom: rs(context, \1))', content)

content = re.sub(r'EdgeInsets\.fromLTRB\(([\d\.]+),\s*([\d\.]+),\s*([\d\.]+),\s*([\d\.]+)\)', r'EdgeInsets.fromLTRB(rs(context, \1), rs(context, \2), rs(context, \3), rs(context, \4))', content)

# SizedBox
content = re.sub(r'SizedBox\(\s*width:\s*([\d\.]+)\s*\)', r'SizedBox(width: rs(context, \1))', content)
content = re.sub(r'SizedBox\(\s*height:\s*([\d\.]+)\s*\)', r'SizedBox(height: rs(context, \1))', content)

# BorderRadius
content = re.sub(r'BorderRadius\.circular\(([\d\.]+)\)', r'BorderRadius.circular(rs(context, \1))', content)

# Height / Width in Container
content = re.sub(r'width:\s*([\d\.]+),', r'width: rs(context, \1),', content)
content = re.sub(r'height:\s*([\d\.]+),', r'height: rs(context, \1),', content)

# Fix double rs e.g., rs(context, rs(context, x))
content = re.sub(r'rs\(context,\s*rs\(context,\s*([\d\.]+)\)\)', r'rs(context, \1)', content)

# Fix height: 1.4 in TextStyle which shouldn't be touched but we replaced `height: 1.4,`
# Wait, let's revert height: rs(context, 1.4) if it is a double < 3.0? No, let's just revert height: rs(context, 1.x) or height: rs(context, 2.x) if we suspect it's line height.
content = re.sub(r'height:\s*rs\(context,\s*([12]\.[\d]+)\)', r'height: \1', content)

with open(path, 'w') as f:
    f.write(content)
print("Done")
