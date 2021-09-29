// Internationalization dictionary
window.lang_dict = {

    // English
    'EN': {
        'introTour': {
            'nextLabel': "Next",
            'prevLabel': "Back",
            'doneLabel': "Done",
            'welcomeTitle': "Welcome!",
            'welcomeText': "Here you can play with a simulation where autonomously trained agents are trying to navigate through a 2D environment.",
            'viewportTitle': "Viewport simulation",
            'viewportText': "Here is the viewport where the simulation is rendered in real time. It allows you to see the environment and visualize live how the agents are dealing with it.<br><br> You can also interact with the simulation using the mouse in order to scroll, zoom or even drag and drop the agents. <br><br> <em>Try it now!</em> ",
            'runTitle': "Run the simulation",
            'runText': 'Click the <span style="color: green"><i class="fas fa-play"></i></span> button to run the simulation. <br> Then, click the <span style="color: #FFC700"><i class="fas fa-pause"></i></span> button to pause it or the <span style="color: red"><i class="fas fa-undo-alt"></i></span> to reset it. <br><br> <em>Try it now!</em>',
            'baseEnvsTitle': "Some environments",
            'baseEnvsText': "Here are some basic environments that will let you become more familiar with the different morphologies of agents. <br> You will be able to load them into the simulation to visualize the behaviour of the different agents.",
            'morphologiesTitle': "Agents morphologies",
            'morphologiesText': "Here are all the morphologies available for the agents. You can select one of several agents for each morphology and add it to the simulation. <br><br> Each agent has been trained to learn an optimal behaviour to navigate through the environment according to its morphology. Try to compare them!",
            'agentsListTitle': "List of running agents",
            'agentsListText': "In this section you can find all the agents that are currently running in the simulation.",
            'customEnvsTitle': "Custom environments",
            'customEnvsText': "Here you can save and download your custom environments but also upload them from previously downloaded files. Try to share them with your friends!",
            'furtherTitle': "Going further...",
            'furtherText': "If you want to customize the environment, access more advanced options or learn more about the context of this demo, open these tabs. <br><br> Enjoy!",
        },

        'introHints': {
            'buttonLabel': "Got it",
            'tips': `<strong>Tips</strong>
                    <ul>
                        <li>You can scroll horizontally and vertically in the environment by dragging the mouse.</li>
                        <li>You can zoom in or out using the mouse wheel.</li>
                        <li>You can select an agent or an asset by clicking on it, and then delete it by pressing the delete key of your keyboard.</li>
                        <li>You can drag and drop an agent or an asset using the mouse.</li>
                        <li>You can change the eraser and assets radius using the mouse wheel.</li>
                    </ul>
                    <br>`
        },

        'agentsList': {
            'title': "List of running agents",
            'follow': "Follow",
            'followTooltip' : "Center the viewport on the agent",
            'savePosTooltip': "Save the agent's position",
            'resetPosTooltip': "Reset the agent's position",
            'deleteAgentTooltip': "Delete the agent",
        },

        'mainButtons':{
            'runBtnTooltip': "Run the simulation",
            'pauseBtnTooltip': "Pause the simulation",
            'resetBtnTooltip': "Reset the simulation",
            'saveBtnTooltip': "Save the current environment"
        },

        'drawingMode': {
            'intro': 'Here you can draw your own parkour!',
            'text': `Select the <strong style="color: green"><i class="fas fa-pencil-alt"></i> Ground</strong> or <strong style="color: dimgrey"><i class="fas fa-pencil-alt"></i> Ceiling</strong> button to start drawing the corresponding terrain shape with the mouse.<br>
                    Be careful not to draw more than one line at different heights if you want the result to be optimal. <br>
                    You can use the <strong style="color: #FFC700"><i class="fas fa-eraser"></i> Erase</strong> button if you need to correct your drawing or the <strong style="color: red"><i class="fas fa-times"></i> Clear</strong> one to clear all your drawing.<br>
                    When you are satisfied with the result, just click the <strong style="color: green">Generate Terrain</strong> button.`,
            'ground': "Ground",
            'ceiling': "Ceiling",
            'erase': "Erase",
            'clear': "Clear",
            'generateTerrain': "Generate Terrain",
            'draw': "Draw",
        },

        'parkourConfig': {
            'terrainGeneration': "<strong>Terrain Generation</strong>",
            'generalParameters': "General Parameters",
            'creepers': "Creepers",
            'drawTabBtn': "Draw Yourself!",
            'procGenTabBtn': "Procedural Generation",
            'procGenText': `You can also use these three sliders to generate the <strong>terrain shapes</strong> automatically.`,
            'smoothing': "Smoothing",
            'waterLevel': "Water level",
            'creepersWidth': "Width",
            'creepersHeight': "Height",
            'creepersSpacing': "Spacing",
            //'creepersType': "Type",
            'rigid': "Rigid",
            'swingable': "Swingable",
        },

        'morphologies': {
            'title': "<strong>Add an agent</strong>",
            'text': "Here you can add an agent to the simulation with the morphology of your choice.",
            'policySelectTooltip': "Select an agent",
            'addBtnTooltip': "Add the agent to the simulation",
            'baby': "baby",
            'teenager': "teenager",
            'adult': "adult",
            'bipedal': {
                'title': "Bipedal",
                'description': "This morphology is composed of a head and two legs which allow it to walk on the floor."
            },
            'spider': {
                'title': "Spider",
                'description': "This morphology is composed of a body and four legs which allow it to walk on the floor."
            },
            'chimpanzee': {
                'title': "Chimpanzee",
                'description': "This morphology is composed of a head, a torso and two arms and legs. It can only move by climbing the ceiling and grasping the creepers.",
            },
            'fish': {
                'title': "Fish",
                'description': "This morphology is composed of a head, a tail and a fin, allowing it to swim in the water.",
            },
        },

        'envsSets': {
            'baseSetText': `To begin you can select one of the following environments to load it into the simulation, and then run it by clicking the <span style="color: green"><i class="fas fa-play"></i></span> button.`,
            'customSetText': `In this section you can store your own custom environments by saving them thanks to the <span style="color: blue"><i class="far fa-save fa-lg"></i></span> button above or by uploading them from a JSON file.`,
            'uploadCard': {
                'title': "Upload an environment",
                'text': `Choose a JSON file then click the <span style="color: orange;"><i class="fas fa-upload"></i></span> button below to save the corresponding environment in your collection.`,
                'uploadBtnTooltip': "Upload the environment from the selected file",
            },
            'downloadBtnTooltip': "Download the environment",
            'deleteBtnTooltip': "Delete the environment",
        },

        'advancedOptions': {
            'renderingOptions': `<strong> Rendering Options </strong>`,
            'drawJoints': "Draw joints",
            'drawJointsTooltip': "Joints are what bind the different bodies together. They also act as motors for the agents morphologies.",
            'drawLidars': "Draw lidars",
            'drawLidarsTooltip': "Lidars are sensors which enable agents to detect nearby obstacles and water.",
            'drawNames': "Draw names",
            'drawNamesTooltip': "Name of the agents.",
            'drawObservation': "Draw observations",
            'drawObservationTooltip': "The observation is a partial view of the environment state at each step on which the agents rely to take an action.",
            'drawReward': "Draw rewards",
            'drawRewardTooltip': "The reward is a value that indicates how good or bad the current state is, according to the objective of the agent.",
            'stepReward': "Step reward",
            'totalReward': "Cumulative reward",
            'assetsTitle': `<strong> Assets </strong>`,
            'assetsText': "Here you can find several types of assets, which are objects that you can add to the simulation using the mouse.",
            'circle': `<i class="fas fa-circle"></i> Ball`,
            'comingSoon': "More assets coming soon...",
        },

        'globalElements': {
            'demoTitle': "Deep Reinforcement Learning Interactive Demo",
            'gettingStarted': "Getting Started",
            'parkourCustomization': "Parkour Customization",
            'advancedOptions': "Advanced Options",
            'about': "About...",
            'saveEnvModal': {
                'title': `Please enter a name and a description for the current environment.`,
                'text': "This environment will be saved in your collection of custom environments so that you could reload it later or download it to share it.",
                'nameLabel': "Name",
                'descriptionLabel': "Description",
                'cancelBtn': "Cancel",
                'confirmBtn': "Save",
            },
        },

        'aboutTab': {
            'purposeTitle': "Purpose of the demo",
            'purposeText': `<p class="mb-2">
                                The goal of this demo is to showcase the challenge of <strong>generalization</strong> to unknown tasks
                                for <strong>Deep Reinforcement Learning (DRL)</strong> agents.
                            </p>

                            <p class="mb-2">
                                <strong>DRL</strong> is a <strong>Machine Learning</strong> approach for teaching <strong>virtual agents</strong>
                                how to solve tasks by combining <strong>Reinforcement Learning</strong> and <strong>Deep Learning</strong> methods.
                                This approach has been used for a diverse set of applications including robotics (e.g. <a href="https://openai.com/blog/solving-rubiks-cube/">Solving Rubik's Cube</a> <a href="#ref1">[1]</a>),
                                video games and boardgames (e.g. <a href="https://deepmind.com/research/case-studies/alphago-the-story-so-far">AlphaGo</a> <a href="#ref2">[2]</a>).
                            </p>

                            <p class="mb-2">
                                In this demo, all the agents have been <strong>autonomously trained</strong> to learn an efficient behaviour to navigate through a 2D environment,
                                combining a DRL algorithm and a teacher algorithm (see <a href="#acl-title">below</a>) so that they can be able to <strong>generalize their behaviour to never-seen-before situations</strong>.
                            </p>

                            <p class="mb-4">
                                The demo provides different tools to customize the environment in order to test and challenge the
                                <strong>robustness</strong> of the agents on different situations.
                            </p>`,
            'rlTitle': "Reinforcement Learning",
            'rlText': `<p>
                            <strong>Reinforcement Learning (RL)</strong> is the study of agents and how they learn by <strong>trial and error</strong>.
                            The main idea is to <strong>reward or punish</strong> an agent according to the actions it takes in order to make it learn an efficient behavior to reach an objective.
                            <br>
                            The RL approaches generally feature an <strong>agent</strong> which evolves and interacts with a <strong>world</strong>.
                            At each interaction step, the agent sees a partial <strong>observation</strong> of the current state of the environment and decides of an action to take.
                            Each action taken by the agent changes the state of the world.
                            The agent also receives a <strong>reward</strong> signal at each step, that indicates how good or bad the current state is
                            according to the objective the agent has to reach.
                        </p>
    
                        <div class="row align-items-center mb-4">
                            <div class="col-12 col-md-6">
                                <p>
                                    The diagram on the right presents this interaction process between the <strong>agent</strong> and the <strong>environment</strong>,
                                    with the different information they exchange at each step.
                                    <br>
                                    <strong>Maximizing the reward</strong> over steps is a way for the agent to learn a behaviour, also called <strong>policy</strong>,
                                    to achieve its objective.
                                </p>
                            </div>
                            <div class="col-12 col-md-6">
                                <img id="rl-diagram" class="w-100" src="images/about/rl_diagram_transparent_bg.png" alt="RL diagram">
                            </div>
                        </div>`,
            'drlTitle': "Deep RL",
            'drlText': `<p class="mb-2">
                            In order to remember and improve the actions taken by the agent, DRL algorithms utilize <strong>artificial neural networks</strong>.
                            With <strong>training</strong>, these neural networks are able to <strong>learn to predict an optimal action to take at each step from the observation received</strong>,
                            thanks to all the observations and rewards previously received after each action during training.
                            Thanks to this, DRL algorithms are able to produce behaviours that are very effective in situations similar to those they were trained on.
                        </p>

                        <div class="row justify-content-center my-4">
                            <img id="rl-demo_diagram" class="w-50" src="images/about/rl_demo_diagram_EN.png" alt="RL demo diagram">
                        </div>

                        <p class="mb-4">
                            However, in real-world applications, the environment rarely remains still and frequently evolves. Therefore one would
                            want DRL agents to be able to <strong>generalize their behaviour</strong> to previously unseen changes of the environment so that
                            they can <strong>adapt to a large range of situations</strong>.
                        </p>`,
            'aclTitle': "Automatic Curriculum Learning",
            'aclText': `<p class="mb-2">
                            One solution to handle this challenge is to train DRL agents on <strong>procedurally generated environments</strong>.
                            <br>
                            <strong>Procedural generation</strong> is a method of automatically creating environments according to some parameters.
                            Using this method, DRL agents can be trained on a <strong>very wide range of environments</strong>, hence allowing them
                            to <strong>generalize their behaviour</strong> to more different situations.
                        </p>

                        <p class="mb-4">
                            However, randomly generating environments during training implies the risk to generate environments that are too difficult or too easy to resolve
                            for the agents, preventing them to continuously learn in an efficient way.
                            <br>
                            Therefore, one would need <strong>smarter training strategies</strong> that propose relevant environments tailored to the current <strong>learning progress</strong> of the <strong>student</strong> (DRL agent).
                            This method is called <strong>Automatic Curriculum Learning (ACL)</strong> <a href="#ref3">[3]</a> and is embodied by a <strong>teacher algorithm</strong> which is trained to learn to generate
                            the most relevant environments throughout the entire training process according to the student performances.
                            <br>
                            This way, the teacher proposes easy environments to the student at the beginning and <strong>gradually increases the difficulty
                            and the diversity</strong> of the tasks in order to guarantee that the <strong>student is progressing while not always facing the same situation or forgetting what it has already learned</strong>.
                        </p>`,
            'aboutDemoTitle': "About the demo",
            'aboutDemoText': `
                            <p class="mb-2">
                                In this demo, all the available agents were trained using <a href="https://spinningup.openai.com/en/latest/algorithms/sac.html">Soft Actor Critic</a> <a href="#ref4">[4]</a>
                                as the <strong>DRL student algorithm</strong> alongside different <strong>ACL teacher algorithms</strong> such as <a href="https://arxiv.org/abs/1910.07224">ALP-GMM</a> <a href="#ref5">[5]</a>.
                                <br>
                                They successfully learned efficient behaviours to move through the environment and to <strong>generalize</strong> to never-seen-before situations.
                            </p>
    
                            <p class="mb-4">
                                The physics of the simulation are handled by the <a href="https://github.com/kripken/box2d.js">box2d.js</a> physics engine
                                which is a direct port to JavaScript of the <a href="https://github.com/erincatto/box2d">Box2D</a> physics engine.
                                <br>
                                The <strong>pre-trained policies</strong> (agents behaviours) are loaded in the browser thanks to <a href="https://www.tensorflow.org/js">TensorFlow.js</a>.
                            </p>`,
            'creditsTitle': "Credits",
            'creditsText': `<p class="mb-4">
                                This demo was designed by <a href="https://github.com/pgermon">Paul Germon</a> as part of an internship within <a href="https://flowers.inria.fr/">Flowers</a>
                                research team at <a href="https://www.inria.fr/fr">Inria</a>. This internship was monitored by Rémy Portelas and Clément Romac,
                                and supervised by Pierre-Yves Oudeyer. Special thanks to Nikita Melkozerov for its very helpful contribution.
                            </p>

                            <ul class="px-3" style="list-style-type: disc">
                                <li>The code of this demo is open-source and can be found on this <a href="https://github.com/pgermon/teach_DRL_demo">github repository.</a></li>
                                <li>The code of the environment and agents is adapted from the <a href="http://developmentalsystems.org/TeachMyAgent/">TeachMyAgent</a> <a href="#ref6">[6]</a> benchmark's Python code to JavaScript.</li>
                            </ul>`,
            'referencesTitle': "References",
            'referencesText': `<ul class="mb-4">
                                    <li id="ref1">[1] OpenAI, Ilge Akkaya, Marcin Andrychowicz, Maciek Chociej, Mateusz Litwin, Bob McGrew, Arthur Petron, Alex Paino, Matthias Plappert, Glenn Powell, Raphael Ribas, Jonas Schneider, Nikolas Tezak, Jerry Tworek, Peter Welinder, Lilian Weng, Qiming Yuan, Wojciech Zaremba, Lei Zhang:
                                        Solving Rubik's Cube with a Robot Hand (2019). <a href="https://arxiv.org/abs/1910.07113">https://arxiv.org/abs/1910.07113</a></li>
                                    <li id="ref2">[2] Silver, D., Huang, A., Maddison, C. et al. Mastering the game of Go with deep neural networks and tree search. Nature 529, 484–489 (2016). <a href="https://doi.org/10.1038/nature16961">https://doi.org/10.1038/nature16961</a></li>
                                    <li id="ref3">[3] Portelas, R., Colas, C., Weng, L., Hofmann, K., & Oudeyer, P. Y. (2020). Automatic curriculum learning for deep rl: A short survey (2020). <a href="https://arxiv.org/abs/2003.04664">https://arxiv.org/abs/2003.04664</a></li>
                                    <li id="ref4">[4] Haarnoja, T., Zhou, A., Abbeel, P., & Levine, S. (2018, July). Soft actor-critic: Off-policy maximum entropy deep reinforcement learning with a stochastic actor. <em>In International conference on machine learning</em> (pp. 1861-1870). PMLR <a href="https://arxiv.org/abs/1801.01290">https://arxiv.org/abs/1801.01290</a></li>
                                    <li id="ref5">[5] Portelas, R., Colas, C., Hofmann, K., & Oudeyer, P. Y. (2020, May). Teacher algorithms for curriculum learning of deep rl in continuously parameterized environments. <em>In Conference on Robot Learning</em> (pp. 835-853). PMLR. <a href="https://arxiv.org/abs/1910.07224">https://arxiv.org/abs/1910.07224</a></li>
                                    <li id="ref6">[6] Romac, C., Portelas, R., Hofmann, K., & Oudeyer, P.-Y. (2021). TeachMyAgent: A Benchmark for Automatic Curriculum Learning in Deep RL. <em>International Conference on Machine Learning</em>, 9052–9063. <a href="https://arxiv.org/abs/2103.09815">https://arxiv.org/abs/2103.09815</a></li>
                                </ul>`,

        }
    },

    // French
    'FR': {
        'introTour': {
            'nextLabel': "Suivant",
            'prevLabel': "Précédent",
            'doneLabel': "Fermer",
            'welcomeTitle': "Bienvenue !",
            'welcomeText': "Ici tu peux jouer avec une simulation dans laquelle des agents entraînés de manière autonome essayent de se déplacer au travers d'un environnement 2D.",
            'viewportTitle': "Fenêtre d'affichage",
            'viewportText': "C'est dans cet espace que la simulation est affichée en temps réel. Cela va te permettre de visualiser en direct comment les agents essayent de s'adapter à leur environment.<br><br> Tu peux aussi interagir avec la simulation à l'aide de la souris pour faire défiler l'environnement, zoomer ou encore déplacer les agents. <br><br> <em>Tu peux essayer dès maintenant !</em>",
            'runTitle': "Lancer la simulation",
            'runText': 'Clique sur le bouton <span style="color: green"><i class="fas fa-play"></i></span> pour lancer la simulation. <br> Tu peux ensuite cliquer sur le bouton <span style="color: #FFC700"><i class="fas fa-pause"></i></span> pour la mettre en pause ou sur le bouton <span style="color: red"><i class="fas fa-undo-alt"></i></span> pour la réinitialiser. <br><br> <em>Tu peux essayer dès maintenant !</em>',
            'baseEnvsTitle': "Quelques environnements",
            'baseEnvsText': "Voici quelques environnements de base qui t'aideront à te familiariser avec les différentes morphologies d'agents. <br> Tu pourras les charger dans la simulation pour voir les comportements des différents agents.",
            'morphologiesTitle': "Les différentes morphologies d'agents",
            'morphologiesText': "Voici toutes les morphologies disponibles pour les agents. Tu peux choisir parmi plusieurs agents différents pour chaque morphologie et l'ajouter à la simulation. <br><br> Chaque agent a été entraîné pour apprendre un comportement efficace pour se déplacer à travers l'environnement en fonction de sa morphologie. Essaye de les comparer !",
            'agentsListTitle': "List des agents actifs",
            'agentsListText': "Dans cette section sont affichés tous les agents actuellement présents dans la simulation.",
            'customEnvsTitle': "Environnements personnalisés",
            'customEnvsText': "Ici tu peux sauvegarder et télécharger tes environnements personnalisés mais aussi en importer depuis des fichiers précédemment téléchargés. Essaye de les échanger avec tes amis !",
            'furtherTitle': "Pour aller plus loin...",
            'furtherText': "Si tu veux personnaliser ton propre environnement, accéder à des options avancées ou en apprendre davantage à propos du contexte autour de cette démo, ouvre ces onglets. <br><br> Amuse-toi bien !",
        },

        'introHints': {
            'buttonLabel': "Ok",
            'tips': `<strong>Astuces</strong>
                    <ul>
                        <li>Tu peux faire défiler l'environnement horizontalement et verticalement à l'aide de la souris.</li>
                        <li>Tu peux zoomer ou dézoomer avec la molette de la souris.</li>
                        <li>Tu peux sélectionner un agent ou un objet en cliquant dessus, puis le supprimer en appuyant sur la touche suppr de ton clavier.</li>
                        <li>Tu peux déplacer un agent ou un objet en le faisant glisser avec la souris.</li>
                        <li>Tu peux changer le rayon de la gomme ou la taille des objets avec la molette de la souris.</li>
                    </ul>
                    <br>`
        },

        'agentsList': {
            'title': "Liste des agents actifs",
            'follow': "Suivre",
            'followTooltip' : "Centrer la fenêtre d'affichage sur l'agent",
            'savePosTooltip': "Sauvegarder la position de l'agent",
            'resetPosTooltip': "Réinitiliaser la position de l'agent",
            'deleteAgentTooltip': "Supprimer l'agent",
        },

        'mainButtons':{
            'runBtnTooltip': "Lancer la simulation",
            'pauseBtnTooltip': "Mettre la simulation en pause",
            'resetBtnTooltip': "Réinitialiser la simulation",
            'saveBtnTooltip': "Sauvegarder l'environnement actuel"
        },

        'drawingMode': {
            'intro': 'Ici tu peux dessiner ton propre parkour !',
            'text': `Selectionne les boutons <strong style="color: green"><i class="fas fa-pencil-alt"></i> Sol</strong> ou <strong style="color: dimgrey"><i class="fas fa-pencil-alt"></i> Plafond</strong> pour commencer à dessiner l'élément du terrain correspondant avec la souris.<br>
                    Fais attention à ne pas superposer plusieurs traits à différentes hauteurs pour obtenir un résultat optimal. <br>
                    Tu peux utiliser le bouton <strong style="color: #FFC700"><i class="fas fa-eraser"></i> Gommer</strong> pour corriger ton dessin ou le bouton <strong style="color: red"><i class="fas fa-times"></i> Effacer</strong> pour tout effacer.<br>
                    Une fois que tu es satisfait du résultat, clique sur le bouton <strong style="color: green"> Générer le terrain</strong>.`,
            'ground': "Sol",
            'ceiling': "Plafond",
            'erase': "Gommer",
            'clear': "Effacer",
            'generateTerrain': "Générer le terrain",
            'draw': "Dessiner",
        },

        'parkourConfig': {
            'terrainGeneration': "<strong>Génération du terrain</strong>",
            'generalParameters': "Paramètres Généraux",
            'creepers': "Lianes",
            'drawTabBtn': "Dessine par toi-même !",
            'procGenTabBtn': "Génération procédurale",
            'procGenText': `Tu peux aussi utiliser ces trois curseurs pour générer <strong>les formes du terrain</strong> de manière automatique.`,
            'smoothing': "Lissage",
            'waterLevel': "Niveau d'eau",
            'creepersWidth': "Largeur",
            'creepersHeight': "Hauteur",
            'creepersSpacing': "Espacement",
            //'creepersType': "Type",
            'rigid': "Rigides",
            'swingable': "Flexibles",
        },

        'morphologies': {
            'title': "<strong>Ajouter un agent</strong>",
            'text': "Ici tu peux ajouter un agent à la simulation avec la morphologie de ton choix.",
            'policySelectTooltip': "Sélectionner un agent",
            'addBtnTooltip': "Ajouter l'agent à la simulation",
            'baby': "bébé",
            'teenager': "adolescent",
            'adult': "adulte",
            'bipedal': {
                'title': "Bipède",
                'description': "Cette morphologie est composée d'une tête et de deux jambes qui lui permettent de marcher sur le sol."
            },
            'spider': {
                'title': "Araignée",
                'description': "Cette morphologie est composée d'un corps et de quatre pattes qui lui permettent de marcher sur le sol."
            },
            'chimpanzee': {
                'title': "Chimpanzé",
                'description': "Cette morphologie est composée d'une tête, d'un corps ainsi que de deux bras et deux jambes. Elle peut uniquement se déplacer en s'accrochant au plafond ou en se balançant de lianes en lianes.",
            },
            'fish': {
                'title': "Poisson",
                'description': "Cette morphologie est composée d'une tête, d'une queue et d'une nageoire, ce qui lui permet de nager dans l'eau.",
            },
        },

        'envsSets': {
            'baseSetText': `Pour commencer tu peux sélectionner un des environnments suivants en cliquant dessus pour le charger dans la simulation, puis lancer celle-ci en cliquant sur le bouton <span style="color: green"><i class="fas fa-play"></i></span>.`,
            'customSetText': `Dans cette section tu peux stocker tes propres environnements personnalisés en les sauvegardant grâce au bouton <span style="color: blue"><i class="far fa-save fa-lg"></i></span> ci-dessus ou en les important depuis un fichier JSON.`,
            'uploadCard': {
                'title': "Importer un environnement",
                'text': `Choisis un fichier JSON puis clique sur le bouton <span style="color: orange;"><i class="fas fa-upload"></i></span> ci-dessous pour importer l'environnement correspondant dans ta collection.`,
                'uploadBtnTooltip': "Importer l'environnement depuis le fichier sélectionné",
            },
            'downloadBtnTooltip': "Télécharger l'environnement",
            'deleteBtnTooltip': "Supprimer l'environnement",
        },

        'advancedOptions': {
            'renderingOptions': `<strong> Options d'affichage </strong>`,
            'drawJoints': "Afficher les joints",
            'drawJointsTooltip': "Les joints sont les liens qui attachent les différents objets physiques ensemble. Ils servent aussi de moteurs pour les morphologies des agents.",
            'drawLidars': "Afficher les lidars",
            'drawLidarsTooltip': "Les lidars sont des capteurs qui permettent aux agents de détecter les obstacles et l'eau à proximité.",
            'drawNames': "Afficher les noms",
            'drawNamesTooltip': "Nom des agents.",
            'drawObservation': "Afficher les observations",
            'drawObservationTooltip': "L'observation d'un agent est une vue partielle de l'état actuel de l'environnement à chaque pas de temps, sur laquelle les agents s'appuient pour effectuer une action.",
            'drawReward': "Afficher les récompenses",
            'drawRewardTooltip': "La récompense est une valeur qui indique la qualité de l'état actuel de l'environnement selon l'objectif que l'agent doit atteindre.",
            'stepReward': "Récompense courante",
            'totalReward': "Récompense cumulée",
            'assetsTitle': `<strong> Objets </strong>`,
            'assetsText': "Ici tu peux trouver plusieurs types d'objets que tu peux ajouter à la simulation avec la souris.",
            'circle': `<i class="fas fa-circle"></i> Boule`,
            'comingSoon': "Plus d'objets à venir...",
        },

        'globalElements': {
            'demoTitle': "Démo Interactive de Deep Reinforcement Learning",
            'gettingStarted': "Commencer",
            'parkourCustomization': "Personnalisation du parkour",
            'advancedOptions': "Options avancées",
            'about': "À propos...",
            'saveEnvModal': {
                'title': `Saisis un nom et une description pour l'environnement actuel`,
                'text': "Cet environnement sera sauvegardé dans ta collection d'environnements personnalisés pour que tu puisses le recharger plus tard ou le télécharger pour le partager.",
                'nameLabel': "Nom",
                'descriptionLabel': "Description",
                'cancelBtn': "Annuler",
                'confirmBtn': "Sauvegarder",
            },
        },

        'aboutTab': {
            'purposeTitle': "Objectif de la démo",
            'purposeText': `<p class="mb-2">
                                Le but de cette démonstration est de mettre en évidence le challenge de <strong>généralisation</strong>
                                 à des nouvelles tâches pour des agents entraînés par <strong>Apprentissage par Renforcement Profond (ARP)</strong>.
                            </p>

                            <p class="mb-2">
                                L'<strong>ARP</strong> est une approche d'<strong>Apprentissage automatique</strong> (<em>Machine Learning</em>)
                                qui permet d'apprendre à des <strong>agents virtuels</strong> à résoudre des tâches en combinant des méthodes 
                                d'<strong>Apprentissage par renforcement</strong> (<em>Reinforcement Learning</em>) et d'<strong>Apprentissage profond</strong> (<em>Deep Learning</em>).
                                Cette approche a été utilisée pour diverses applications dont notamment la robotique (e.g. <a href="https://openai.com/blog/solving-rubiks-cube/">Solving Rubik's Cube</a>) <a href="#ref1">[1]</a>,
                                les jeux vidéo et les jeux de plateau (e.g. <a href="https://deepmind.com/research/case-studies/alphago-the-story-so-far">AlphaGo</a>) <a href="#ref2">[2]</a>.
                            </p>

                            <p class="mb-2">
                                Dans cette démo, tous les agents ont été <strong>entraînés de manière autonome</strong> dans le but d'apprendre un 
                                comportement efficace pour traverser un environnement 2D.
                                Ils ont été entraînés en combinant un algorithme d'ARP et un algorithme enseignant (voir <a href="#acl-title">ci-dessous</a>) pour qu'ils soient capables 
                                de <strong>généraliser leur comportement à des situations inédites</strong>.
                            </p>

                            <p class="mb-4">
                                La démo fournit différents outils pour personnaliser l'environnement dans le but de tester et mettre la
                                 <strong>robustesse</strong> des agents à l'épreuve lorsqu'ils font face à différentes situations.
                            </p>`,
            'rlTitle': "Apprentissage par Renforcement",
            'rlText': `<p>
                            L'<strong>Apprentissage par renforcement (AR)</strong> est l'étude des agents virtuels et de leur apprentissage par <strong>essais et erreurs</strong>.
                            L'idée principale est de <strong>récompenser ou punir</strong> un agent en fonction des actions qu'il effectue pour qu'il apprenne un comportement efficace pour atteindre un objectif.
                            <br>
                            Les approches d'<strong>AR</strong> sont généralement composées d'un <strong>agent</strong> qui évolue dans un <strong>monde</strong> ou <strong>environnement</strong>  et interagit avec.
                            À chaque pas de temps, l'agent voit une <strong>observation</strong> partielle de l'état actuel de l'environnement et décide d'effectuer une action.
                            Chaque action effectuée par l'agent change l'état de l'environnement. L'agent reçoit également une <strong>récompense</strong> 
                            à chaque pas de temps, qui indique à quel point l'état actuel du monde est bon ou mauvais selon l'objectif que l'agent doit atteindre.
                        </p>
    
                        <div class="row align-items-center mb-4">
                            <div class="col-12 col-md-6">
                                <p>
                                    Le schéma ci-contre présente ce processus d'interaction entre l'<strong>agent</strong> et l'<strong>environment</strong>,
                                    avec les différentes informations qu'ils échangent à chaque pas de temps.
                                    <br>
                                    <strong>Maximiser la récompense</strong> au cours du temps est un moyen pour l'agent d'apprendre un comportement optimal (ou <strong>politique</strong>)
                                    pour atteindre son objectif.
                                </p>
                            </div>
                            <div class="col-12 col-md-6">
                                <img id="rl-diagram" class="w-100" src="images/about/rl_diagram_fr.png" alt="Schéma AR">
                            </div>
                        </div>`,
            'drlTitle': "Apprentissage par renforcement profond",
            'drlText': `<p class="mb-2">
                            Pour améliorer continuellement les actions effectuées par les agents, les algorithmes d'<strong>ARP</strong> utilisent 
                            des <strong>réseaux de neurones artificiels</strong>.
                            Avec de l'<strong>entraînement</strong>, ces réseaux de neurones sont capables d'<strong>apprendre à prédire une action optimale 
                            à effectuer à chaque étape à partir de l'observation reçue</strong> grâce à toutes les 
                            observations et les récompenses préalablement reçues après chaque action effectuée au cours de l'entraînement.
                            Grâce à cela, les algorithmes d'<strong>ARP</strong> sont capables de produire des comportements très efficaces 
                            dans des situations similaires à celles sur lesquelles ils ont été entraînés.
                        </p>

                        <div class="row justify-content-center my-4">
                            <img id="rl-demo_diagram" class="w-50" src="images/about/rl_demo_diagram_FR.png" alt="RL demo diagram">
                        </div>

                        <p class="mb-4">
                            Cependant, dans des applications réelles, l'environnement reste rarement identique en permanence mais évolue. Par conséquent, 
                            l'idéal serait que les agents d'<strong>ARP</strong> soient capables de <strong>généraliser leur comportement</strong> 
                            à des changements inédits du monde pour qu'ils puissent <strong>s'adapter à un large éventail de situations</strong>.
                        </p>`,
            'aclTitle': "Programme d'apprentissage automatique",
            'aclText': `<p class="mb-2">
                            Une solution pour résoudre en partie ce problème est d'entraîner les agents d'<strong>ARP</strong> sur des <strong>environnements générés procéduralement</strong>.
                            <br>
                            La <strong>génération procédurale</strong> est une méthode permettant de créer automatiquement des environnements en fonction de quelques paramètres.
                            En utilisant cette méthode, les agents peuvent être entraînés sur un <strong>très large éventail d'environnements</strong>, leur permettant ainsi
                            de <strong>généraliser leur comportement</strong> à plus de situations différentes.
                        </p>

                        <p class="mb-4">
                            Néanmoins, le fait de générer des environnements aléatoires au cours de l'entraînement implique le risque de générer 
                            des environnements trop difficiles ou trop faciles à résoudre pour les agents, les empêchant par conséquent d'apprendre en continu de manière efficace.
                            <br>
                            L'idéal serait donc de disposer de <strong>stratégies d'entraînement plus intelligentes</strong> qui proposeraient des
                            environnements pertinents adaptés à l'<strong>avancement de l'apprentissage</strong> de l'<strong>élève</strong> (agent).
                            Cette méthode est appelée <strong>programme d'apprentissage automatique</strong> (<em>Automatic Curriculum Learning</em>) <a href="#ref3">[3]</a>
                            et est incarnée par un <strong>algorithme enseignant</strong> qui est entraîné dans le but d'apprendre à générer des environnements 
                            les plus pertinents possibles tout au long du processus d'entraînement de l'élève en fonction de l'évolution de ses performances.
                            <br>
                            De cette manière, l'enseignant commence par proposer des environnements faciles à l'élève puis <strong>augmente leur difficulté et leur diversité petit à petit</strong>  
                            pour garantir que <strong>l'élève progresse continuellement tout en ne rencontrant pas toujours la même situation et en n'oubliant pas 
                            ce qu'il a déjà appris</strong>.
                        </p>`,
            'aboutDemoTitle': "À propos de la démo",
            'aboutDemoText': `
                            <p class="mb-2">
                                Dans cette démo, tous les agents ont été entraînés avec <a href="https://spinningup.openai.com/en/latest/algorithms/sac.html">Soft Actor Critic</a> <a href="#ref4">[4]</a>
                                comme <strong>algorithme élève d'ARP</strong> aux côtés de différents <strong>algorithmes enseignants</strong> comme par exemple <a href="https://arxiv.org/abs/1910.07224">ALP-GMM</a> <a href="#ref5">[5]</a>.
                                <br>
                                Les agents ont ainsi appris avec succès des comportements efficaces pour se déplacer à travers les envirionnements 2D en 
                                <strong>généralisant</strong> leur comportement à des situations inédites.
                            </p>
    
                            <p class="mb-4">
                                La physique de la simulation est gérée par le moteur physique <a href="https://github.com/kripken/box2d.js">box2d.js</a>
                                qui est un portage direct en JavaScript du moteur physique <a href="https://github.com/erincatto/box2d">Box2D</a>.
                                <br>
                                Les <strong>politiques pré-entraînées</strong> (comportements des agents) sont chargées dans le navigateur grâce à <a href="https://www.tensorflow.org/js">TensorFlow.js</a>.
                            </p>`,
            'creditsTitle': "Crédits",
            'creditsText': `<p class="mb-4">
                                Cette démo a été conçue par <a href="https://github.com/pgermon">Paul Germon</a> dans le cadre d'un stage au sein de 
                                l'équipe de recherche <a href="https://flowers.inria.fr/">Flowers</a> au laboratoire <a href="https://www.inria.fr/fr">Inria</a>. 
                                Ce stage était encadré par Rémy Portelas et Clément Romac, et supervisé par Pierre-Yves Oudeyer. 
                                Remerciements particuliers à Nikita Melkozerov pour sa contribution.
                            </p>

                            <ul class="px-3" style="list-style-type: disc">
                                <li>Le code source de cette démo est libre d'accès sur ce <a href="https://github.com/pgermon/teach_DRL_demo">dépôt github.</a></li>
                                <li>Le code de l'environnement et des agents a été adapté en JavaScript à partir du code Python de <a href="http://developmentalsystems.org/TeachMyAgent/">TeachMyAgent</a> <a href="#ref6">[6]</a>.</li>
                            </ul>`,
            'referencesTitle': "Références",
            'referencesText': `<ul class="mb-4">
                                    <li id="ref1">[1] OpenAI, Ilge Akkaya, Marcin Andrychowicz, Maciek Chociej, Mateusz Litwin, Bob McGrew, Arthur Petron, Alex Paino, Matthias Plappert, Glenn Powell, Raphael Ribas, Jonas Schneider, Nikolas Tezak, Jerry Tworek, Peter Welinder, Lilian Weng, Qiming Yuan, Wojciech Zaremba, Lei Zhang:
                                        Solving Rubik's Cube with a Robot Hand (2019). <a href="https://arxiv.org/abs/1910.07113">https://arxiv.org/abs/1910.07113</a></li>
                                    <li id="ref2">[2] Silver, D., Huang, A., Maddison, C. et al. Mastering the game of Go with deep neural networks and tree search. Nature 529, 484–489 (2016). <a href="https://doi.org/10.1038/nature16961">https://doi.org/10.1038/nature16961</a></li>
                                    <li id="ref3">[3] Portelas, R., Colas, C., Weng, L., Hofmann, K., & Oudeyer, P. Y. (2020). Automatic curriculum learning for deep rl: A short survey (2020). <a href="https://arxiv.org/abs/2003.04664">https://arxiv.org/abs/2003.04664</a></li>
                                    <li id="ref4">[4] Haarnoja, T., Zhou, A., Abbeel, P., & Levine, S. (2018, July). Soft actor-critic: Off-policy maximum entropy deep reinforcement learning with a stochastic actor. <em>In International conference on machine learning</em> (pp. 1861-1870). PMLR <a href="https://arxiv.org/abs/1801.01290">https://arxiv.org/abs/1801.01290</a></li>
                                    <li id="ref5">[5] Portelas, R., Colas, C., Hofmann, K., & Oudeyer, P. Y. (2020, May). Teacher algorithms for curriculum learning of deep rl in continuously parameterized environments. <em>In Conference on Robot Learning</em> (pp. 835-853). PMLR. <a href="https://arxiv.org/abs/1910.07224">https://arxiv.org/abs/1910.07224</a></li>
                                    <li id="ref6">[6] Romac, C., Portelas, R., Hofmann, K., & Oudeyer, P.-Y. (2021). TeachMyAgent: A Benchmark for Automatic Curriculum Learning in Deep RL. <em>International Conference on Machine Learning</em>, 9052–9063. <a href="https://arxiv.org/abs/2103.09815">https://arxiv.org/abs/2103.09815</a></li>
                                </ul>`,

        }
    }
}