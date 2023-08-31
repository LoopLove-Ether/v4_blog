from PIL import Image,ImageDraw,ImageFont
import string
import random
from io import BytesIO

str_all = string.digits + string.ascii_letters #大小写+数字

#生成随机的颜色
def random_color():
    return (random.randint(0,255),random.randint(0,255),random.randint(0,255))

#生成多个图片验证码
#第一个参数是图片的宽高
#第二个参数是验证码的长度
#第三个参数是混淆点的数量
#第四个参数是混淆线的数量
def random_code(size=(184,44),length=4,point_num=100,line_num=10):
    # 第一个参数是图片背景颜色模式
    # 第二个参数是图片的size
    # 第三个参数是图片的背景色
    width,height = size#拆包
    img = Image.new('RGB',(width,height),color=(255,255,255)) #生成图片

    #可以在画布上画点、画线、写文字
    draw = ImageDraw.Draw(img)#以img为背景,并生成和img同大小的画布

    #定义图片文字字体
    #第一个参数是字体的目录、第二个参数是文字的size(单位是像素)

    font = ImageFont.truetype(font='E:\\Blog\\v4_blog\\static\\my\\font\\MexicanTequila.ttf',size=32)#生成字体对象

    #写文字需要指定文字的坐标、内容、颜色、字体
    #通过for循环使文字之间产生间隔
    valid_code = ''       #随机验证码
    for i in range(length):
        random_chart = random.choice(str_all) #随机字符
        draw.text((40*i+10,10),random_chart,(0,0,0),font=font)#书写文字
        valid_code += random_chart
    print(valid_code)

    #图片验证码混淆(随机生成点)
    #第一个参数是点的坐标,第二个参数是点的颜色
    for i in range(point_num):
        x,y = random.randint(0,width),random.randint(0,height)
        draw.point((x,y),random_color())#在图片上画点进行混淆



    #图片验证码混淆(随机生成线)
    # 第一个参数是线的坐标(二维),第二个参数是线的颜色
    for i in range(line_num):
        x1, y1 = random.randint(0, width), random.randint(0, height)
        x2, y2 = random.randint(0, width), random.randint(0, height)
        draw.line((x1,y1,x2,y2),fill=random_color())

    # 创建一个内存句柄(智能指针)
    f = BytesIO()

    # 将图片保存到内存句柄中
    img.save(f,'PNG')#保存图片

    # 读取内存句柄(从指针指向的地址中读取图片的字节数据)
    data = f.getvalue()
    return (data,valid_code)


if __name__ == '__main__':
    random_code()





