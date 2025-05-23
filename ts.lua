require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "ts_aly"

activity.setTheme(R.Theme_Yellow)
activity.setContentView(loadlayout(ts_aly))
activity.setTitle("数字海报")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end
