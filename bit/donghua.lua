function donghua(view,time)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(view,"scaleX",{0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(view,"scaleY",{0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1}).setDuration(time).start()
end

function dh(view)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(view,"scaleX",{0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1}).setDuration(500).start()
  ObjectAnimator().ofFloat(view,"scaleY",{0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1}).setDuration(1000).start()
end

--文字动画
import "android.view.animation.Animation"
import "android.view.animation.TranslateAnimation"
import "android.view.animation.RotateAnimation"
import "android.view.animation.AlphaAnimation"

--动画设置___平移动画
平移动画_右=TranslateAnimation(activity.height,0,0,0)
平移动画_右.setDuration(1000)
平移动画_右.setFillAfter(true)

平移动画_左=TranslateAnimation(-activity.height,0,0,0)
平移动画_左.setDuration(1000)
平移动画_左.setFillAfter(true)

平移动画_下=TranslateAnimation(0,0,activity.height,0)
平移动画_下.setDuration(1000)
平移动画_下.setFillAfter(true)

平移动画_上=TranslateAnimation(0,0,-activity.height,0)
平移动画_上.setDuration(1000)
平移动画_上.setFillAfter(true)
