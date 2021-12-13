import datetime


def log_n_flush(msg):
    f = open("/home/pi/debug.txt", "a")
    f.write("[{}] {}\n".format(datetime.datetime.now(), msg))
    f.close()
