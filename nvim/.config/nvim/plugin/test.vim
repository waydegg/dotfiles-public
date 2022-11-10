if !has('python3')
    echomsg ':python3 is not available, vim-find-test will not be loaded.'
    finish
endif

python3 import test_plugin
python3 from test_plugin import woof

command! Meow python3 test_plugin.meow()
command! Hello python3 test_plugin.hello()
command! Woof python3 woof.woofer()
