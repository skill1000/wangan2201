require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "bit/donghua"
import "bit/ttf"
import "js_aly"

activity.setTheme(R.Theme_Blue)
activity.setContentView(loadlayout(js_aly))
activity.setTitle("班级介绍")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

file,err=io.open("sdcard/网安2201Cache/data.log")
if err==nil then
  总=io.open("sdcard/网安2201Cache/data.log"):read("*a")
  t1.setText(总:match("【班级介绍】(.-)【/班级介绍】"))
 else
  pm("未获取到云端数据，请先获取到云端数据再重试本操作！")
end

scroll.startAnimation(平移动画_下)
mi.startAnimation(平移动画_下)
image.startAnimation(平移动画_下)
card.startAnimation(平移动画_下)
t1.startAnimation(平移动画_下)

ttf(t1,"ttf/soft.ttf")

