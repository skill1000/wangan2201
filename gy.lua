require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "gy_aly"
import "bit/donghua"
import "bit/ttf"

activity.setTheme(R.Theme_Red)
activity.setContentView(loadlayout(gy_aly))
activity.setTitle("公益劳动")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

card.startAnimation(平移动画_下)
title.startAnimation(平移动画_下)
t1.startAnimation(平移动画_下)
t2.startAnimation(平移动画_下)

ttf(title,"ttf/soft.ttf")
ttf(t1,"ttf/soft.ttf")
ttf(t2,"ttf/soft.ttf")
