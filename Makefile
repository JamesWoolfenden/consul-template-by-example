#Makefile

.PHONY: clean

clean:

transform:
	consul-template -template miss.tpl:miss.out -once
