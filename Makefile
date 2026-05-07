.PHONY: transform

transform:
	consul-template -template miss.tpl:miss.out -once
