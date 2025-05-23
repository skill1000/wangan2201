require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "bjzysj_aly"
import "thing"
import "bit/donghua"

activity.setTheme(R.Theme_Light_Gray)
activity.setContentView(loadlayout(bjzysj_aly))
activity.setTitle("班级重要事件")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

data={}
--创建适配器
adp=LuaAdapter(activity,data,thing)
--设置适配器
list.Adapter=adp

function main(pt)
  j = 0
  while true do
    j = j + 1
    if pt:match("【事件"..j.."】(.-)【/事件"..j.."】") == nil then
      break
     else
      文=pt:match("【事件"..j.."】(.-)【/事件"..j.."】")
      标题=文:match("【标题】(.-)【/标题】")
      内容=文:match("【/标题】(.+)")
      table.insert(data,{tit=标题,txt=内容})
    end
  end
end

list.startAnimation(平移动画_下)
