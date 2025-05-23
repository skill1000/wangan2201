require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "tc_aly"
import "bit/donghua"

activity.setTheme(R.Theme_Purple)
activity.setContentView(loadlayout(tc_aly))
activity.setTitle("同学特长")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

card1.startAnimation(平移动画_下)
t_1_1.startAnimation(平移动画_下)
image_1_1.startAnimation(平移动画_下)
image_1_2.startAnimation(平移动画_下)
