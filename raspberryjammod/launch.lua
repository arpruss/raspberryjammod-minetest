local source = debug.getinfo(1).source:sub(2)

print(os.execute('start /MIN "raspberryjammod-minetest-python-test" /MIN "c:\\pypy\\pypy.exe" test.py'))
print("running")
print(os.execute('taskkill /F /FI "WINDOWTITLE eq raspberryjammod-minetest-python-test"'))
print("done")
while 1 do end

