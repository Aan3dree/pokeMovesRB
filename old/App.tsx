import { StatusBar } from 'expo-status-bar';
import React, {useState} from 'react';
import { Button, View, TextInput, Image, ScrollView, FlatList } from 'react-native';
import styles from './src/styles';
import axios from 'axios';


export default function App() {
  
  const [moves, setMoves] = useState()
  const [name, setName] = useState<string>()

  function handleName(value: string) {
    setName(value);
    console.log(name)
  }
  

  function handleMoves() {
    

    axios.get(`https://pokeapi.co/api/v2/pokemon/${name?.toLowerCase()}`, {
      params:{
        _moves: moves
      }
    })
      .then(res => {
        const generation: string = res.data.moves[0].version_group_details[0].version_group.name;
        console.log(generation);
        //setMoves(res.data.moves);
        console.log(res.data.moves.length)
        let row = []
        for(let i = 0; res.data.moves.length; i++){
          //console.log('primeiro for')
          for(let b = 0; res.data.moves[i].version_group_details[b]; b++){
            //console.log('segundo for')
            if(res.data.moves[i].version_group_details[b].version_group.name == generation && res.data.moves[i].version_group_details[b].move_learn_method.name == "level-up"){
              row.push(`Lv: ${res.data.moves[i].version_group_details[b].level_learned_at} ${res.data.moves[i].move.name}`);
              console.log(row);
            }
          }
        }
        setMoves(row)
        //console.log(res);
        
        //console.log(moves)
      })
  }
  
  return (
    
      <View style={styles.container}>
        <View style={styles.logoWraper}>
          <Image 
            style={styles.logo}
            source={require('./src/assets/Img/logo.png')}
          /> 
        </View>
        <View style={styles.inputWraper}>
          <TextInput
            style={styles.input} 
            placeholder={'Nome do Pokemon'}
            //value={name}
            onChangeText={handleName}
          />
          <Button
            title="Buscar"
            onPress={() => handleMoves()}
            color="blue"
          />
        </View>
        
        <View style={styles.embaixo}>
          
        </View> 
        <StatusBar style="auto" />
      </View>
    
  );
}


