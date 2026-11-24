def gather_measurements():
    #array of measurements 
    measurements = []

    #gathers a series of positive ints
    print("Enter positive numerical measurements (enter -1 to finish):")

    while True:
        try:
            #uses explicit casting to float to allow precise input of values
            value = float(input(f"Value {len(measurements) + 1}: "))

            #breaking of the collection, ending the collection of inpits
            if value == -1:
                break

            #factor only the accepted scope (positive integers and -1)
            if value <= 0:
                print("Only enter positive numbers or -1 to finish.")
                continue

            #append to list
            measurements.append(value)

        #cases where input is invalid
        except ValueError:
            print("Invalid input. Please enter a numerical value.")

    return measurements

#helper function to identify minimum value in the list
def find_minimum(values):
    minimum = values[0]

    for value in values:
        if value < minimum:
            minimum = value

    return minimum

#takes the central values of the list, (50%) omitting 25% on each direction
def get_center(values):
    #basically get the indices of what's needed (at 25% of the lenghth and 75% of the length)
    start_index = int(len(values) * 0.25)
    end_index = int(len(values) * 0.75)

    return values[start_index:end_index]

#aslong as the values are not equal to the minimum, they will be squared and added to the new list
def transform_subset(subset, overall_minimum):
    transformed = []

    for value in subset:
        if value != overall_minimum:
            transformed.append(value ** 2)

    return transformed

#calculating the sum and mean of the values in the list, also handles the exception of an empty list
def calculate_sum_and_mean(values):
    total = 0.0

    for value in values:
        total += value

    if len(values) == 0:
        mean = 0.0
    else:
        mean = total / len(values)

    return total, mean


def display_results(original, minimum, middle_subset, transformed, total, mean):
    print("\n|| Results ||")
    print(f"Total items collected: {len(original)}")
    print(f"Lowest value in dataset: {minimum}")
    print(f"Middle 50% subset extracted: {middle_subset}")
    print(f"Transformed subset (squared values excluding minimums): {transformed}")

    print("\n|| Summary ||")
    print(f"Original Count : {len(original)}")
    print(f"Sliced Length : {len(middle_subset)}")
    print(f"Transformed Length: {len(transformed)}")
    print(f"Calculated Sum: {total:.2f}")

    if len(transformed) == 0:
        print("Calculated Mean: 0.00")
        print("No elements remaining after transformation.")
    else:
        print(f"Calculated Mean: {mean:.2f}")


#start of the program
measurements = gather_measurements()

if len(measurements) == 0:
    print("\nNo measurements were entered. Nothing to process.")
else:
    overall_minimum = find_minimum(measurements)
    middle_subset = get_center(measurements)
    transformed_subset = transform_subset(middle_subset, overall_minimum)
    calculated_sum, calculated_mean = calculate_sum_and_mean(transformed_subset)

    display_results(
        measurements,
        overall_minimum,
        middle_subset,
        transformed_subset,
        calculated_sum,
        calculated_mean
    )
