from urllib.parse import urlencode


class Search:
    def __init__(self, key, order, order_list, query_params):
        self.key = key
        self.order_list = order_list
        self.order = order
        self.query_params = {}
        # 避免筛选条件过多时无法通过get方法取到正常的值
        for i in query_params:
            self.query_params[i] = query_params.getlist(i)

    def order_html(self):
        order_list = []
        for li in self.order_list:
            self.query_params[self.key] = li[0]  # 排序方式

            if self.order == li[0]:
                li = f'<li class="active"><a href="?{self.query_encode}">{li[1]}</a></li>'
            else:
                li = f'<li><a href="?{self.query_encode}">{li[1]}</a></li>'
            order_list.append(li)
        return ''.join(order_list)

    @property
    # 对参数字段进行url编码(字符串)
    def query_encode(self):
        return urlencode(self.query_params, doseq=True)
        # return self.query_params.urlencode()
