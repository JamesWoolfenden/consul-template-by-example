### Consul template: By Example
This example shows how to use consul and consul-template to get data and how to handle missing and default values.

### Set-up the tools
Run both shell scripts to get the tools consul and consul-template.

### Start/Spawn Consul
`consul agent -dev &`

There's an example template file called miss.tpl. This looks like:

```
Key:Foo:{{key "foo"}}
MissingKey:{{if keyExists "MissingKey"}}{{key "MissingKey"}}{{else}}nothing{{end}}
DefaultValue:{{keyOrDefault "Duffer" ""}}
```
First we'll add some data to Consul.

``` consul kv put foo bar ```

Then when we run consul-template:

```consul-template -template miss.tpl:miss.out -once ```

Check the contents of the miss.out file.
```
Key:Foo:bar
MissingKey:nothing
DefaultValue: 
```
Then we'll add a value for MissingKey variable.

``` consul kv put MissingKey Time```
and retry:
```consul-template -template miss.tpl:miss.out -once ```

miss.out now becomes:
```
Key:Foo:bar
MissingKey:Time
DefaultValue:
```
