package cn.second_hand.user.utils;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
 

public class MongoDBUtils {

    public static MongoDatabase getConnect()
    {
		 ConnectionString connString = new ConnectionString(
			    "mongodb://marin:a123456@ds019950.mlab.com:19950/heroku_p78k6xgn"
			);
			MongoClientSettings settings = MongoClientSettings.builder()
			    .applyConnectionString(connString)
			    .retryWrites(false)
			    .build();
			MongoClient mongoClient = MongoClients.create(settings);
			MongoDatabase database = mongoClient.getDatabase("heroku_p78k6xgn");
			return  database;
    
}
}
