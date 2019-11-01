#!/usr/bin/ruby

=begin
Here are two class : LevelSystem and & CalorielCal

By running the program, it shows a menu for user to choose to use which function (initialize a test person with empty information)

Enter 1 for Level System; 2 for Calorie Calculator
Inside Level System:
	methods: getLevel(), nextLevel(score), levelUp(), addScore(type, count), doExercise(exercise)
	User can choose to 1. doExercise, 2. levelUp

	doExercise() - add the score according to the type of exercise
	levelUp()    - get the total score and justify the level of user and print out the result

Inside Calorie Calculator
	methods: getCalorie(), dailyNeed(sex, weight, height, age), eat(food), work(exercise) 
	User can choose to get 1. dailyNeed, 2. eat, 3. work, 4. getCalorie

	dailyNeed()  - ask for some personal information and calculate the daily calorie need
	eat()   	 - input the food or drink that user intake
	work()       - input the workouts that user did
	getCalorie 	 - display the current intake, output and balance of calorie of that day



There are 5 test cases commented at the end of the program

There are these kind of testing user:
Saml   - (healthy man)
Jack   - (unhealthy man)
Mary   - (normal woman)
Andy   - (normal boy kid)
Wendy  - (normal old lady)

With the test cases, they show the result between different age group, different sex and different lifestyle

=end

class LevelSystem
	#initialize all user are Beginner and no score
	Level = "Beginner"
	@@light_score,  @@heavy_score, @@total_score= 0, 0, 0

	#display the current level
	def getLevel()
		puts "\nYour current level is #{Level}"
	end

	#display how many score needed for next level
	def nextLevel(score)
		@@temp = 1000
		if (score >= 100000)
			puts "\nYou are already at the top of the rank"
		elsif (score >= 10000)
			@@temp = 100000
		elsif (score >= 5000)
			@@temp = 10000
		elsif (score >= 1000)
			@@temp = 5000	
		end
		puts "#{@@temp-score} more to go to next level"
	end

	#to see can level up or not
	def levelUp()
		#add the total score and show it
		@@total_score = @@light_score + @@heavy_score
		puts "\nYour total score is #{@@total_score}"
		#change to current level when arriving different score
		if(@@total_score >= 100000)
			Level.replace 'Ruby'
			puts "\nExercise is already part of your life"
		elsif(@@total_score >= 10000)
			Level.replace 'Gold'
			puts "\nYou seems enjoying doing exercise"
		elsif(@@total_score >= 5000)
			Level.replace 'Silver'
			puts "\nYou have done a good job"
		elsif(@@total_score >= 1000)
			Level.replace 'Bronze'
			puts "\nYou are having a good start point"
		else
			puts "\nYou need to do more exercise to level Up :)"
		end
		getLevel()
		nextLevel(@@total_score)
	end

	#add score to light_score or heavy_score
	def addScore(type, count)
		#finish any light exercise
		if(type == 'l')
			@@light_score += count*5
		#finish any heavy exercise
		elsif(type == 'h')
			@@heavy_score += count*10
		else
			puts "ERROR, put input again"
		end
	end

	#add different score when finish different exercise
	def doExercise(exercise)
		#add the different score when finish different exercise
		if(exercise == 'sleep')
			addScore('l', 0.6)
		elsif(exercise == 'yoga') 
			addScore('l', 28)
		elsif(exercise == 'hiking')
			addScore('l', 36)
		elsif(exercise == 'tennis')
			addScore('h', 47)
		elsif(exercise == 'basketball')
			addScore('h', 60)
		elsif(exercise == 'swimming')
			addScore('h', 60)
		elsif(exercise == 'running')
			addScore('h', 90)
		end
	end
end

class CalorieCal
	@@calorie, @@intake, @@output = 0, 0, 0
	@@BMR, @standard= 0, 0

	#display the intake and output and the balance of that day
	def getCalorie()
		puts "\nYou have intake #{@@intake} calorie today"
		puts "\nYou have output #{@@output} calorie today"
		if(@@output > @@intake)
			puts "\nYou have loss #{@@output - @@intake} calorie today"
		else 
			puts "\nYou have absorb #{@@intake - @@output} calorie"
		end
	end

	#calculated by Miffin-St Jeor Equation for BMR
	#weight in kg, height in cm
	#get the daily need for the user
	def dailyNeed(sex, weight, height, age)
		#for men
		if(sex == 'm')
			@@BMR = 10*weight + 6.25*height - 5*age + 5
			
		elsif(sex == 'f')
			@@BMR = 10*weight + 6.25*height - 5*age + 161
		end
		puts "\nYour daily calorie need is #{@@BMR*1.55}"
	end

	#increase the intake by intaking different food or drink
	def eat(food) 
		case food 
		when 'butter'
			@@intake += 740
		when 'beef'
			@@intake += 521
		when 'chips'
			@@intake += 570
		when 'pork', 'cheese'
			@@intake += 340
		when 'beer', 'puddings'
			@@intake += 200
		when 'rice', 'soup'
			@@intake += 150
		when 'salad', 'egg'
			@@intake += 100
		when 'fruit', 'milk'
			@@intake += 60
		when 'tea', 'coffee', 'soda'
			@@intake += 10
		end
	end

	#increase the output by doing different type of exercise
	def work(exercise) 
		case exercise
		when 'sleep'
			@@output += 60
		when 'yoga'
			@@output += 280
		when 'hiking'
			@@output += 360
		when 'tennis'
			@@output += 470
		when 'basketball', 'swimming'
			@@output += 600
		when 'running'
			@@output += 900
		end
	end
end

#allow users to input the information and get different result or information
#the empty person that allow the users to test
testl = LevelSystem.new()
testc = CalorieCal.new()
#clear the terminal to gain a better view for users
system("cls")
#print out the main menu
puts "Please select the function you want to use:"
puts "\n1. Level System"
puts "2. Calorie Calculator"
puts "3. Exit\n"
#get the input by users
@input = gets.chomp.to_i
if(@input == 1) #level system
	system("cls")
	while(@rank != 3)
		puts "\n1. Do Exercise"
		puts "2. Level Up"
		puts "3. Exit\n"
		@rank = gets.chomp.to_i
		system("cls")
		if(@rank == 1)
			puts "\nWhich exercise have you done?\n"
			puts "\nbasketball / hiking / running / sleep / swimming / tennis / yoga\n\n"
			@rank11 = gets.chomp
			testl.doExercise(@rank11)
		elsif(@rank == 2)
			testl.levelUp()
		end
	end
end
if(@input == 2) #calorie caluclator
	system("cls")
	while(@calc !=5)
		puts "\n1. My Daily Need"
		puts "2. Eat / Drink"
		puts "3. Workouts"
		puts "4. My Calorie"
		puts "5. Exit\n"
		@calc = gets.chomp.to_i
		system("cls")
		if(@calc == 1)
			puts "\nPlease enter your sex(m/f)\n"
			@sexc = gets.chomp
			puts "\nPlease enter your weight(in kg)\n"
			@weightc = gets.chomp.to_i
			puts "\nPlease enter your height(in cm)\n"
			@heightc = gets.chomp.to_i
			puts "\nPlease enter your age\n"
			@agec = gets.chomp.to_i
			testc.dailyNeed(@sexc, @weightc, @heightc, @agec)
		elsif(@calc == 2)
			puts "\nWhat have you eaten/drink today (select one of the following): "
			puts "\nFood:  beef / butter / cheese / chips / egg / fruit / pork / puddings / rice / salad / soup"
			puts "\nDrink: beer / coffee / milk / soda / tea\n\n"
			@eaten = gets.chomp
			testc.eat(@eaten)
		elsif(@calc == 3)
			puts "\nWhat have you workout today (select one of the following): "
			puts "\nbasketball / hiking / running / sleep / swimming / tennis / yoga\n\n"
			@works = gets.chomp
			testc.work(@works)
		elsif(@calc == 4)
			testc.getCalorie()
		end
	end
end

# #healthy man
# puts "\nHere is Sam (healthy man) sample : "
# Saml = LevelSystem.new()
# Samc = CalorieCal.new()
# Saml.doExercise('running')
# Saml.doExercise('swimming')
# Saml.doExercise('running')
# Saml.doExercise('running')
# Saml.levelUp()
# Samc.dailyNeed('m', 40, 176, 29)
# Samc.eat('salad')
# Samc.eat('beef')
# Samc.eat('pork')
# Samc.eat('fruit')
# Samc.eat('soda')
# Samc.work('running')
# Samc.work('swimming')
# Samc.work('running')
# Samc.work('running')
# Samc.getCalorie()
# puts "\n\n"

# #unhealthy man
# puts "\nHere is Jack (unhealthy man) sample : "
# Jackl = LevelSystem.new()
# Jackc = CalorieCal.new()
# Jackl.doExercise('sleep')
# Jackl.doExercise('sleep')
# Jackl.doExercise('sleep')
# Jackl.levelUp()
# Jackc.dailyNeed('m', 100, 170, 26)
# Jackc.eat('chips')
# Jackc.eat('chips')
# Jackc.eat('chips')
# Jackc.eat('butter')
# Jackc.eat('beer')
# Jackc.eat('beer')
# Jackc.work('sleep')
# Jackc.work('sleep')
# Jackc.work('sleep')
# Jackc.getCalorie()
# puts "\n\n"

# #normal woman
# puts "\nHere is Mary (normal woman) sample : "
# Maryl = LevelSystem.new()
# Maryc = CalorieCal.new()
# Maryl.doExercise('running')
# Maryl.levelUp()
# Maryc.dailyNeed('f', 56, 167, 24)
# Maryc.eat('beef')
# Maryc.eat('puddings')
# Maryc.eat('rice')
# Maryc.eat('soup')
# Maryc.eat('egg')
# Maryc.eat('coffee')
# Maryc.getCalorie()
# puts "\n\n"

# #normal boy kid
# puts "\nHere is Andy (normal boy kid) sample : "
# Andyl = LevelSystem.new()
# Andyc = CalorieCal.new()
# Andyl.doExercise('basketball')
# Andyl.doExercise('running')
# Andyl.levelUp()
# Andyc.dailyNeed('m', 40, 143, 10)
# Andyc.eat('cheese')
# Andyc.eat('chips')
# Andyc.eat('puddings')
# Andyc.eat('rice')
# Andyc.eat('butter')
# Andyc.eat('fruit')
# Andyc.eat('tea')
# Andyc.getCalorie()
# puts "\n\n"

# #normal old lady
# puts "\nHere is Wendy (normal old lady) sample : "
# Wendyl = LevelSystem.new()
# Wendyc = CalorieCal.new()
# Wendyl.doExercise('yoga')
# Wendyl.doExercise('hiking')
# Wendyl.doExercise('tennis')
# Wendyl.levelUp()
# Wendyc.dailyNeed('f', 60, 162, 68)
# Wendyc.eat('pork')
# Wendyc.eat('cheese')
# Wendyc.eat('fruit')
# Wendyc.eat('soup')
# Wendyc.eat('rice')
# Wendyc.eat('milk')
# Wendyc.eat('coffee')
# Wendyc.eat('tea')
# Wendyc.getCalorie()
# puts "\n\n"
