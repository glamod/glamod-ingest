report_types = ['sub_daily', 'UNUSED', 'monthly', 'daily']


def get_report_types():
    return report_types


def get_report_type(item):
    if type(item) is int:
        item = str(item)

    if len(item) == 1:
        return report_types[int(item)]
    else:
        return report_types.index(int(item))

