import os

import obsws_python as obs


def main():
    client = obs.ReqClient(
        password="p0KHoQKVW3aueQfB",
        host="localhost",
        port=4455,
    )
    status = client.get_record_status()
    if status.output_active:
        client.stop_record()
    else:
        client.start_record()


if __name__ == "__main__":
    main()
