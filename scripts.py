import vim

def printb(msg):
    vim.current.buffer.append(str(msg))


def sum_selection():
    floats = map(float, filter(lambda n: n != '', vim.current.range))
    total = sum(floats)
    printb(total)

