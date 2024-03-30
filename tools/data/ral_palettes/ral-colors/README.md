# Thanks

<https://github.com/ieskudero/ral-colors/blob/main/RAL>

## Used Tools

1. <https://convertjson.com/javascript-object-to-json.htm>

2. <https://github.com/JeffMv/json2csv-py3>

## Actions

Clone <https://github.com/JeffMv/json2csv-py3> to local.

```sh
python -m venv venv
```

```sh
.\venv\Scripts\activate
```

```sh
pip install -r requirements.txt
```

```sh
pip install jsmin
```

```sh
cd .project_flutter_image_converter/ral_palettes/ral-colors
```

```sh
python ../../../gen_outline.py -d classic.json -o outline.json
```

```sh
python ../../../json2csv.py classic.json -k outline.json -o 1.csv
```
