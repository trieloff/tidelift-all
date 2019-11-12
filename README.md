# Tidelift All

> A rising tide lifts all the boats

`tidelift-all.sh` is a small shell script that applies a uniform Tidelift policy (in the form of a `tidelift.yml` file) to a number of GitHub repositories

## Usage

```bash
$ sh tidelift-all.sh my-repo my-other-repo
```

Or if you want to apply it to many repos:

```bash
$ curl "https://api.github.com/search/repositories?q=org:adobe" | jq .items[].name | xargs sh tidelift-all.sh -o adobe
```

## Advanced Usage

### `-o` `--org` Select a different GitHub username or org

The default value is `adobe`, but you can override this with your user name by running

```bash
$ sh tidelift-all.sh -o trieloff <repo-name>
```

### `-f` `--file` Add a different file

The default value is `.tidelift.yml`, but you can override this with any other file name by running

```bash
$ sh tidelift-all.sh -f .renovaterc.json
```

### `-m` `--message` Change the commit message

The default value is `chore(tidelift): adding list of forbidden licenses`, but you can override this with a more accurate commit message by running

```bash
$ sh tidelift-all.sh -m "foo bar"
```

### `-w` `--overwrite` Overwrite files

The default behavior is to skip repositories that already contain the specified file. With `-w` you can force overwriting.

## Limitations

- [ ] does not support patching of configs
- [x] `adobe` org is hardcoded
- [ ] it's really just a simple script and I like it that way
- [ ] contributions welcome

## License

Apache-2.0
