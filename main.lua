require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "main_aly"
import "bit/ttf"
import "bit/donghua"

activity.setTheme(R.Theme_Blue)
activity.setTitle("网安2201课程提醒")
activity.setContentView(loadlayout(main_aly))
activity.ActionBar.hide()

ttf(文字,"ttf/soft.ttf")
文字.startAnimation(平移动画_下)
图标.startAnimation(平移动画_上)

task(1000,function()
  activity.newActivity("home",android.R.anim.fade_in,android.R.anim.fade_out)
  activity.finish()
end)
