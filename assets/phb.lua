require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "phb_aly"
import "phb_list"
import "bit/write"
import "bit/donghua"
import "bit/password1"
import "bit/wrigte"

activity.setTheme(R.Theme_Blue)
activity.setContentView(loadlayout(phb_aly))
activity.setTitle("排行榜")

activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  if item.Title==nil then
    activity.finish()
  end
end

file,err=io.open("sdcard/网安2201Cache/phb.log")
if err==nil then
  content=io.open("sdcard/网安2201Cache/phb.log"):read("*a")
  年级 = content:match("【年级】(.-)【/年级】")
  记分册 = content:match("【记分册】(.-)【/记分册】")
  目标 = io.open("sdcard/网安2201Cache/data.log"):read("*a"):match("【"..年级.."】(.-)【/"..年级.."】")
 else
  pm("未获取到云端数据，请先获取到云端数据再重试本操作！")
end

图片 = {}
名字 = {}
file,err=io.open("sdcard/网安2201Cache/data.log")
if err==nil then
  uio=io.open("sdcard/网安2201Cache/data.log"):read("*a")
  write("sdcard/网安2201Cache/name.log",uio:match("【同学】(.-)【/同学】"))
  for c in io.lines("sdcard/网安2201Cache/name.log") do
    table.insert(图片,c:match("|(.+)"))
    table.insert(名字,c:match("(.+)|"))
  end
 else
  pm("未获取到云端数据，请先获取到云端数据再重试本操作！")
end

xio = 0
学生 = {}
while true do
  xio = xio + 1
  if 目标:match("【同学"..xio.."】(.-)【/同学"..xio.."】") == nil then
    break
   else
    table.insert(学生,目标:match("【同学"..xio.."】(.-)【/同学"..xio.."】"))
  end
end

背分数 = {}

function SDWI(list)
  wc = {}
  for k,re in ipairs(背分数) do
    if re ~= "空" then
      table.insert(wc, re)
    end
  end
  min = math.min(unpack(wc))
  -- 创建一个新的表，其中包含原始列表的项和们的索引
  local indexed_list = {}
  for i, v in ipairs(list) do
    if v == "空" then
      indexed_list[i] = {value = min - 1, index = i}
     else
      indexed_list[i] = {value = v, index = i}
    end
  end
  -- 使用比较函数进行降序排序
  table.sort(indexed_list, function(a, b)
    return a.value > b.value
  end)
  -- 提取排序后的值和它们的原始索引
  local sorted_values = {}
  local original_indices = {}
  for _, item in ipairs(indexed_list) do
    table.insert(sorted_values, item.value)
    table.insert(original_indices, item.index)
  end
  return sorted_values, original_indices
end

for i,x in pairs(学生) do
  count = 0
  总分数 = 0
  if x == "空" then
    table.insert(背分数,"空")
   else
    记分目标 = x:match("【"..记分册.."】(.-)【/"..记分册.."】")
    while true do
      count = count + 1
      if 记分目标:match("【记录"..count.."】(.-)【/记录"..count.."】") == nil then
        table.insert(背分数,总分数)
        break
       else
        文 = 记分目标:match("【记录"..count.."】(.-)【/记录"..count.."】")
        分数 = 文:match("【分数】(.-)【/分数】")
        总分数 = 总分数 + tonumber(分数)
      end
    end
  end
end

value,index=SDWI(背分数)

data = {}
adp = LuaAdapter(activity,data,phb_list)
list.Adapter = adp

for i, v in ipairs(value) do
  if v ~= min - 1 then
    table.insert(data,{image = 图片[index[i]],name = 名字[index[i]],ct = v.."分"})
  end
end

list.startAnimation(平移动画_下)

list.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent, v, pos,id)
    --事件
    student = 目标:match("【"..名字[index[id]].."】(.-)【/"..名字[index[id]].."】")
    password1("study",名字[index[id]],student,记分册)
  end
})
