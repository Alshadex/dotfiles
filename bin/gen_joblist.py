#!/usr/bin/python3
import random
num_jobs = input("enter number of jobs to create: ")
num_jobs = int(num_jobs) + 1
jobs_file = open("custom_joblist.txt", "w")

for i in range(0, num_jobs):
    job_type = random.randint(0,3)
    num_resources = random.randint(1,8)
    job = str(i) + " " + str(job_type) + " " + str(num_resources)
    choices = list(range(num_resources))
    random.shuffle(choices)
    for res_id in choices:
        job += " " + str(res_id)
    if i != num_jobs -1:
        job += "\n"

    jobs_file.write(job)
jobs_file.close()
