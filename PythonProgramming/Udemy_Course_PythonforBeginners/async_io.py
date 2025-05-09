import asyncio
from asyncio import Task
from datetime import datetime


async def fetch_data(input_data) -> dict:
    print("fetching data...")
    start_time = datetime.now()
    await asyncio.sleep(3)
    end_time = datetime.now()
    print("Data retrieved")

    return {"input": input_data, "start_time": f"{start_time:%H:%M:%S}", "end_time":f"{end_time:%H:%M:%S}"}

async def main():
    task1: Task[dict] = asyncio.create_task(fetch_data(1))
    task2: Task[dict] = asyncio.create_task(fetch_data(2))

    data1:dict = await task1
    data2:dict = await task2

    print(f"{data1=}")
    print(f"{data2=}")

if __name__ == "__main__":
    main()