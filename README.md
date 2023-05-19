#### Set up
```
$ sudo snap install pre-commit --classic
$ pre-commit install
```

#### For development:
``` $ chmod +x src/entrypoint.sh ```

``` $ docker compose up ```

### Run tests:
In separate tab

``` $ docker compose exec web bash ``` - get into web container

``` $ dbt build ```