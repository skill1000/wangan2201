import "android.graphics.Typeface"--导入包(必须)
import "java.io.File"--导入包(必须)
function ttf(hong,sk)--创建函数
  hong.setTypeface(Typeface.createFromFile(File(activity.getLuaDir(sk))))
end