import math

class Pagination:
    def __init__(self, current_page, all_count, base_url, query_params, per_page=20, pager_page_count=11,position='pos'):
        """
        :param current_page:当前页码
        :param all_count:数据库中的总条数
        :param base_url:原始 URL
        :param query_params:保留原搜索条件(参数字段)
        :param per_page:一页显示多少条
        :param pager_page_count:最多显示多少个页码
        """
        # 参数实例化
        self.current_page = current_page
        self.all_count = all_count
        self.per_page = per_page
        #锚点
        self.position = position

        # current_count就是总页数
        self.current_count = math.ceil(all_count/per_page)

        # GET请求,请求体中传入的参数只能是满足条件的页码数字
        try:
            self.current_page = int(current_page)
            if not 0 < self.current_page <= self.current_count:
                self.current_page = 1
        except Exception:
            self.current_page = 1


        self.base_url = base_url
        self.query_params = query_params
        self.pager_page_count = pager_page_count

        # 分页的中位数
        self.half_pager_count = int(self.pager_page_count / 2)
        if self.current_count < self.pager_page_count:
            # 可分页的页码小于最大显示页码
            self.pager_page_count = self.current_count

    # 生成页码
    def page_html(self):
        # 计算页码的起始和结束
        # 分类讨论
        # 1.正常情况:所选页码在中间
        start = self.current_page - self.half_pager_count
        end = self.current_page + self.half_pager_count
        # 2.非正常情况:所选页码在左侧或右侧
        if self.current_page <= self.half_pager_count:
            # 在最左侧
            start = 1
            end = self.pager_page_count
        if self.current_page + self.half_pager_count >= self.current_count:
            # 在最右侧
            start = self.current_count - self.pager_page_count + 1
            end = self.current_count

        # 生成分页
        page_list = []
        # 上一页按钮 切换页数
        if self.current_page != 1:
            self.query_params['page'] = self.current_page - 1
            page_list.append(f'<li><a href="{self.base_url}?{self.query_encode}#{self.position}">上一页</a></li>')

        # 数字按钮 切换页数
        for i in range(start,end+1):
            self.query_params['page'] = i
            # 给当前选中的页数一点小小的特殊样式
            if self.current_page == i:
                # url拼接搜索条件
                li = f'<li class="active"><a href="{self.base_url}?{self.query_encode}#{self.position}">{i}</a></li>'
            else:
                li = f'<li><a href="{self.base_url}?{self.query_encode}#{self.position}">{i}</a></li>'
            page_list.append(li) #写入分页列表

        #下一页按钮 切换页数
        if self.current_page != self.current_count:
            self.query_params['page'] = self.current_page + 1
            page_list.append(f'<li><a href="{self.base_url}?{self.query_encode}">下一页</a></li>')

        if len(page_list) == 1:
            # 不显示分页器
            page_list = []
        return ''.join(page_list)

    @property
    # 对参数字段进行url编码
    def query_encode(self):
        return self.query_params.urlencode()

    # 切片的开始位置
    @property
    def start(self):
        return (self.current_page - 1) * self.per_page

    # 切片的结束位置
    @property
    def end(self):
        return self.current_page * self.per_page

if __name__ == '__main__':
    pager = Pagination(
        current_page = 1,
        all_count = 100,
        base_url = "/article",
        query_params = {'tag':'python'},
        per_page=5,
        pager_page_count=9
    )
    print(pager.page_html())