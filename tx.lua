require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "tx_aly"
import "item1"
import "bit/pm"
--先导入io包
import "java.io.*"
import "bit/donghua"
import "bit/write"

activity.setTheme(R.Theme_Light_Gray)
activity.setContentView(loadlayout(tx_aly))
activity.setTitle("同学介绍")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

名字 = {}
图片 = {}

file,err=io.open("sdcard/网安2201Cache/data.log")
if err==nil then
  uio=io.open("sdcard/网安2201Cache/data.log"):read("*a")
  write("sdcard/网安2201Cache/name.log",uio:match("【同学】(.-)【/同学】"))
  for c in io.lines("sdcard/网安2201Cache/name.log") do
    table.insert(图片,c:match("|(.+)"))
    table.insert(名字,c:match("(.+)|"))
  end
  总=io.open("sdcard/网安2201Cache/data.log"):read("*a")
 else
  pm("未获取到云端数据，请先获取到云端数据再重试本操作！")
end

--创建项目数组
data={}

--创建适配器
adp=LuaAdapter(activity,data,item1)
--设置适配器
lt.Adapter=adp

n = 0

while true do
  n = n + 1
  if 总:match("【班级"..tostring(n).."】(.-)【/班级"..tostring(n).."】")==nil then
    break
   else
    table.insert(data,{image=图片[n],name=名字[n],myself=总:match("【班级"..tostring(n).."】(.-)【/班级"..tostring(n).."】")})
  end
end

card.startAnimation(平移动画_下)
title.startAnimation(平移动画_下)
lt.startAnimation(平移动画_下)
