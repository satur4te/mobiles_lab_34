import retrofit.Call
import retrofit.http.GET
import retrofit2.http.POST

// Model class for our Jokes
data class DataModel(
    var categories:ArrayList<String>,
    var created_at: String,
    var icon_url:String,
    var id:String,
    var updated_at:String,
    var url:String,
    var value:String
):java.io.Serializable

interface ApiService {
    @GET("jokes/random")
    fun getjokes(): Call<DataModel>
}