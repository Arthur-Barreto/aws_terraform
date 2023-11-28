# Use instructions

## Instalation For Linux

Give permission to execute the file:

```bash
chmod +x install.sh
```

Run the file:

```bash
./install.sh
```

## Instalation for Other distributions

Please, go to official [k6](https://k6.io/docs/get-started/installation/) documentation.


## Test instructions

First, copy the **DNS name** of the load balancer created by the terraform script.

Then, go to the **config.js** file and paste the **DNS name** in the **DNS** variable.

Then, run the following command:

```bash
k6 run stress.js
```