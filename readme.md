### Consul template: By Example
This is a very simple example shows how to use consul and consul-template to get data in and out, and how to handle missing and default values. The consul setup is only for development purposes.

Download this repository [here](https://github.com/JamesWoolfenden/consul-template-by-example)

### Set-up the tools
Run both shell scripts (*setup.sh* and *setup-consul.sh*) to get the tools consul and consul-template. The install examples assume linux but this could be any supported platform as long as the tools are installed in your path.

### Start/Spawn Consul
``` consul agent -dev & ```

There's an example template file called *miss.tpl*. This looks like:
```
Key:Foo:{{key "foo"}}
MissingKey:{{if keyExists "MissingKey"}}{{key "MissingKey"}}{{else}}nothing{{end}}
DefaultValue:{{keyOrDefault "Duffer" ""}}
```
Consul-template uses the Go templating format- curly brackets the rest of the file is treated as text. The first line is a regular KV retrieval, the second line shows how to cope with missing values and the last line for default values.  

First we'll add some data to Consul.

``` consul kv put foo bar ```

Then when we run consul-template:

```consul-template -template miss.tpl:miss.out -once ```

The -once option "Do not run the process as a daemon".

Check the contents of the **miss.out** file.
```
Key:Foo:bar
MissingKey:nothing
DefaultValue:
```
Then we'll add a value for *MissingKey* variable.

``` consul kv put MissingKey Time ```

and retry:
```consul-template -template miss.tpl:miss.out -once ```

**miss.out** now becomes:
```
Key:Foo:bar
MissingKey:Time
DefaultValue:
```
So there you have it a pretty basic example for using some of the basics behind consul and consul-template as a KV store.
