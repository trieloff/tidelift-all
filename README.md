# Tidelift All

> A rising tide lifts all the boats

`tidelift-all.sh` is a small shell script that applies a uniform Tidelift policy (in the form of a `tidelift.yml` file) to a number of GitHub repositories

## Usage

```bash
$ sh tidelift-all.sh my-repo my-other-repo
```

Or if you want to apply it to many repos:

```bash
$ curl "https://api.github.com/search/repositories?q=org:adobe" | jq .items[].name | xargs sh tidelift-all.sh
```

## Limitations

- [ ] does not support patching of configs
- [ ] `adobe` org is hardcoded
- [ ] it's really just a simple script and I like it that way
- [ ] contributions welcome

## License

Apache-2.0
