require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "zz_aly"
import "bit/ttf"
import "bit/donghua"
import "ver"

activity.setTheme(R.Theme_Green)
activity.setContentView(loadlayout(zz_aly))
activity.setTitle("关于软件")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

ttf(name,"ttf/soft.ttf")
ttf(package,"ttf/soft.ttf")
ttf(version,"ttf/soft.ttf")
ttf(creater,"ttf/soft.ttf")
ttf(studio,"ttf/soft.ttf")
ttf(language,"ttf/soft.ttf")
ttf(log,"ttf/soft.ttf")

version.setText("版本："..tostring(ver))

scroll.startAnimation(平移动画_下)
card.startAnimation(平移动画_下)
icon.startAnimation(平移动画_下)
name.startAnimation(平移动画_下)
package.startAnimation(平移动画_下)
version.startAnimation(平移动画_下)
creater.startAnimation(平移动画_下)
studio.startAnimation(平移动画_下)
language.startAnimation(平移动画_下)
log.startAnimation(平移动画_下)
